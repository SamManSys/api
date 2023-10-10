module CompatibilityView
  def self.included(base)
    base.primary_key = :id
  end
end
