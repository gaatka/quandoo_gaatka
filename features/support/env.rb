$: << File.dirname(__FILE__)+'/../lib'

ENVIRONMENT = (ENV['ENVIRONMENT'] || '/^$/').to_sym
raise "You need to create a config file named '#{ENVIRONMENT}.yml' under lib/config" unless File.exists? "#{File.dirname(__FILE__)}/../../lib/config/#{ENVIRONMENT}.yml"

require "watir-webdriver"
require "rspec"

include Selenium

case ENV["BROWSER"]
  when "ff", "Firefox"
    profile = WebDriver::Firefox::Profile.from_name "Watir"
    url = "http://127.0.0.1:4444/wd/hub"
    caps = WebDriver::Remote::Capabilities.firefox(:firefox_profile => profile)
  when "chrome", "Chrome"
    url = "http://127.0.0.1:4444/wd/hub"
    caps = WebDriver::Remote::Capabilities.chrome
  else
    caps = WebDriver::Remote::Capabilities.firefox
    url = "http://127.0.0.1:4444/wd/hub"
end

browser = Watir::Browser.new(
    :remote,
    :url => url,
    :desired_capabilities => caps)

require 'page_helper'
require 'env_config'
require 'heroku'
require 'pages'

World PageHelper

Heroku.browser = browser

Before do
  @browser = browser
  Watir.default_timeout = 5
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
  browser.cookies.clear
end

at_exit do
  browser.close
end