require "rubygems"
require "bundler/setup"
require "capybara/cucumber"
require "faker"

Capybara.default_driver = :selenium
Capybara.app_host = "http://qa.lacie-unlam.org"
Capybara.run_server = false
World(Capybara)