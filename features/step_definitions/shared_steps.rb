# encoding: utf-8

Given /^I have signed up for an account$/ do
  sign_up_as user_email
end

Given /^I am logged in$/ do
  find('li#current_session').should have_link("Salir")
end

Given /^An admin account exists$/ do
  sign_up_as admin_email
end

Given /^An admin is logged in$/ do
  sign_in_as admin_email
end

Given /^There is at least one exposition$/ do
  visit "/expos/#{this_year}"
  within ".title" do
    page.should have_content("ExpoProyecto #{this_year}")
  end
  # step "An admin account exists"
  # admin_visits "/expos/new"
  # select this_year, from: "date_year"
  # click_button "Guardar"
  # sign_out
end

Given /^I have registered my project for this years exposition$/ do
  visit "/expos/#{this_year}/projects/new"
  fill_in "project_title", with: project_title
  select "Ingeniería informática", from: "project_faculty"
  fill_in "project_subject", with: Faker::Lorem.sentence
  select "Docentes", from: "project_group_type"
  fill_in "project_contact", with: (0..1).map { Faker::Internet.email }.join(", ")
  select "Demostración", from: "project_expo_mode"
  fill_in "project_description", with: project_description
  click_link "Add"
  fill_in "Nombre", with: Faker::Name.name
  click_button "Guardar"
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
  # visit "/expos/#{this_year}/projects"
  # within ".projects" do
  #   click_link project_title
  # end
end

Then /^I should see its title$/ do
  within ".title" do
    page.should have_content(PR_TITLE)
  end
end

Then /^I should see its description$/ do
  page.should have_content(PR_DESC)
end

PR_TITLE = "QA Project"
PR_DESC = "Dummy test project"

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

def sign_up_as(email, password = "please")
  visit "/users/sign_up"
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  click_button "Registrarse"
end

def sign_in_as(email, password = "please")
  visit "/users/sign_in"
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Ingresar"
end

def admin_email
  "root@example.com"
end

def sign_out
  click_link "Salir"
end