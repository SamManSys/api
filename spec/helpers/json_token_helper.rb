module JsonTokenHelper
  def valid_token
    payload = {
      "oauthClientId": "sammansys",
      "displayName": "Test User",
      "roles": [],
      "iss": "https://www.ecmc.ed.ac.uk/cas",
      "client_id": "sammansys",
      "uid": "testuser",
      "grant_type": "AUTHORIZATION_CODE",
      "permissions": [],
      "scope": [],
      "memberOf": [
        "cn=harbor_admins,ou=groups,dc=ecmc,dc=ed,dc=ac,dc=uk",
        "cn=cruk-tg,ou=sammansys,ou=groups,dc=ecmc,dc=ed,dc=ac,dc=uk",
        "cn=ohdsi,ou=groups,dc=ecmc,dc=ed,dc=ac,dc=uk",
        "cn=nhs_admins,ou=groups,dc=ecmc,dc=ed,dc=ac,dc=uk"
      ],
      "exp": DateTime.now.next_day.strftime('%s').to_i,
      "iat": DateTime.now.strftime('%s').to_i,
      "jti": "AT-8-qqFk3EPKJGr-3KQDy6DvD8oWV7-O7EvF",
      "aud": "https://oauth.pstmn.io/v1/callback",
      "scopes": []
    }

    JWT.encode payload, Rails.application.credentials.oauth2[:secret], 'HS512'
  end

  def jsonapi_headers
    media_type = 'application/vnd.api+json'
    {
      'CONTENT_TYPE' => media_type,
      'HTTP_ACCEPT' => media_type,
      'HTTP_AUTHORIZATION': valid_token
    }
  end
end