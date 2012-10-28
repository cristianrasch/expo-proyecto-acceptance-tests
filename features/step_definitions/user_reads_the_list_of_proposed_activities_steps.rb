# encoding: utf-8

Given /^there are some activities planed ahead$/ do
  admin_visits "/expos/#{this_year}/activities"
  page.should have_selector("ul li")
end

Then /^I should those activities listed$/ do
  page.should have_content("Lucha de robots")
  page.should have_content("Museo de electrónica")
end