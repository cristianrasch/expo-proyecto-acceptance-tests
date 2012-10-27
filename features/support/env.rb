require "rubygems"
require "bundler/setup"
require "capybara/cucumber"
require "faker"
require "net/http"
require "uri"
require "date"

require 'capybara/poltergeist'
# TARGET_URI = URI("http://localhost:3000/")
TARGET_URI = URI("http://qa.lacie-unlam.org/")
Capybara.app_host = TARGET_URI.to_s
Capybara.run_server = false
World(Capybara)