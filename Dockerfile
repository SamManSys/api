FROM ruby:3.1-slim as base

LABEL "org.opencontainers.image.created"=$BUILD_DATE
LABEL "org.opencontainers.image.authors"="paul.d.mitchell@ed.ac.uk"
LABEL "org.opencontainers.image.source"="https://git.ecdf.ed.ac.uk/sammansys/api"
LABEL "org.opencontainers.image.version"=$VERSION
LABEL "org.opencontainers.image.vendor"="The University of Edinburgh"
LABEL "org.opencontainers.image.title"="SamManSys"
LABEL "org.opencontainers.image.description"=" The Sample Management System"

WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Throw-away build stage to reduce size of final image
FROM base as build

RUN buildDeps='build-essential default-libmysqlclient-dev git' \
    && apt-get update -qq && apt-get install apt-transport-https  \
    && apt-get install -y --no-install-recommends $buildDeps \
    && rm -rf /var/lib/apt/lists/*

# Install application gems
COPY Gemfile* ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git
    # bundle exec bootsnap precompile --gemfile

COPY . .

#RUN bundle exec bootsnap precompile app/ lib/
#RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final stage for app image
FROM base
RUN baseDeps='default-mysql-client libvips' \
    && apt-get update -qq && apt-get install -y --no-install-recommends apt-transport-https  \
    && apt-get install -y --no-install-recommends $baseDeps \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

RUN useradd rails --create-home --shell /bin/bash && \
    chown -R rails:rails /rails
USER rails:rails

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000

CMD ["./bin/rails", "server"]
