require "rubygems"
require "bundler/setup"

require "capybara/cucumber"

Capybara.default_driver = :selenium
Capybara.app_host = "http://expo-proyecto.lacie-unlam.org"
Capybara.run_server = false
World(Capybara)