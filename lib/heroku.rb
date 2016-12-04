require 'env_config'

module Heroku

  extend PageHelper
  extend RSpec::Expectations
  extend RSpec::Matchers

  class << self;
    attr_accessor :browser
  end

  SITE = :application
  BASE_URL = EnvConfig.get SITE, :base_url

end