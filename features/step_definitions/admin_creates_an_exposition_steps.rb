When /^I visit the new exposition page$/ do
  admin_visits "/expos/new"
end

When /^I create an expo named "(.*?)" in (\d+)$/ do |expo_name, expo_year|
  select expo_year, from: "date_year"
  fill_in "exposition_name", with: expo_name
  click_button "Guardar"
end

Then /^I should be redirected to the "(.*?)" page$/ do |expo_name|
  within ".title" do
    page.should have_content(expo_name)
  end
end