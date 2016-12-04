# Cucumber Example Tests for https://the-internet.herokuapp.com/

These are just a few example implementations for some features on the Heroku Internet Page using Watir-Webdriver and Cucumber.

### Pre-requisites

* Ruby 2.2.5 and Bundler
* Selenium Server 
* Firefox browser, additionally Chrome browser might be used

Installation steps:
- Install Ruby 2.2.5 from an installer downloaded from [rubyinstaller.org](https://rubyinstaller.org/downloads/) or using other installation method, e.g. [RVM](https://rvm.io/rvm/install) `rvm install 2.2.0`.
- Install Bundler running `gem install bundler`. If the gem is not installed on your machine because of certificate issue, refer to this [guide](http://guides.rubygems.org/ssl-certificate-update/) for solutions.
- Download a [stable](http://selenium-release.storage.googleapis.com/index.html?path=2.53/) or the [newest](http://www.seleniumhq.org/download/) Selenium Server.
You can start the server running `java -jar selenium-server-standalone-<your_version_here>.jar`
- Clone/download the project to the folder of your choice.
- Cd into the root folder and run `bundle install` to install Cucumber and Watir-Webdriver. If you need debugging option add e.g. gem 'ruby-debug-ide' to the gemfile.
- Install a Ruby IDE, e.g. [RubyMine](https://www.jetbrains.com/ruby/download/#section=windows-version).
- Run `cucumber` to execute the tests. If your tests fail on Firefox (e.g. hovering action seem to be failing on the newest Firefox version) and you wish to enforce using Chrome, define environment variable (e.g. browser = chrome) in your cucumber configuration.
