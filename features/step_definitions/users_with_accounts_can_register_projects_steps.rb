# encoding: utf-8

When /^I visit the new project page$/ do
  visit "/expos/#{this_year}/projects/new"
end

When /^I register a project titled "(.*?)"$/ do |project_title|
  fill_in "project_title", with: project_title
  select "Ingeniería informática", from: "project_faculty"
  fill_in "project_subject", with: Faker::Lorem.sentence
  select "Docentes", from: "project_group_type"
  fill_in "project_contact", with: (0..1).map { Faker::Internet.email }.join(", ")
  select "Demostración", from: "project_expo_mode"
  fill_in "project_description", with: "whatever.."
  click_link "Add"
  fill_in "Nombre", with: Faker::Name.name
  click_button "Guardar"
end