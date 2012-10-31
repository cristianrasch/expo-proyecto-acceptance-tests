# encoding: utf-8

Given /^I have signed up for an account$/ do
  sign_up user_email, "please"
end

Given /^I am logged in$/ do
  find('li#current_session').should have_link("Salir")
end

Given /^that I have signed in$/ do
  sign_in
end

Given /^that I have signed in as an administrator$/ do
  sign_in
end

Given /^There is at least one exposition$/ do
  visit "/expos/#{this_year}"
  within ".title" do
    page.should have_content("ExpoProyecto #{this_year}")
  end
end

Given /^there is a project registered for that exposition$/ do
  visit "/expos/#{this_year}/projects"
  page.should have_selector("table.projects tr td")
  # step "I have signed up for an account"
  # step "I have registered my project for this years exposition"
  # sign_out
end

When /^I visit the home page$/ do
  visit "/"
end

When /^I visit the login page$/ do
  visit "/users/sign_in"
end

When /^I visit that project's page$/ do
  visit "/projects/qa-project"
end

Then /^I should see its title$/ do
  within ".title" do
    page.should have_content(PR_TITLE)
  end
end

Then /^I should see its description$/ do
  page.should have_content(PR_DESC)
end

Then /^a project with the title of "(.*?)" should exist$/ do |project_title|
  visit "/expos/#{this_year}/projects"
  within "table.projects" do
    page.should have_link(project_title)
  end
end

Then /^I should get back a file named "(.*?)"$/ do |filename|
  page.response_headers['Content-Disposition'].should include("filename=\"#{filename}\"")
end

PR_TITLE = "QA Project"
PR_DESC = "Dummy test project"
ADMIN_EMAIL = "admin@example.com"
ADMIN_PASSWD = "secret"

def this_year
  @year ||= Date.today.year.to_s
end

def user_email
  @user_email ||= Faker::Internet.email
end

def admin_visits(path)
  uri = TARGET_URI.clone
  uri.userinfo = "root:lacie789"
  visit URI.join(uri.to_s, path).to_s
end

def sign_up(email = ADMIN_EMAIL, password = ADMIN_PASSWD)
  visit "/users/sign_up"
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  click_button "Registrarse"
end

def sign_in(email = ADMIN_EMAIL, password = ADMIN_PASSWD)
  visit "/users/sign_in"
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Ingresar"
end

def sign_out
  click_link "Salir"
end