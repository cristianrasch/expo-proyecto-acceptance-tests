Given /^I am at this years exposition page$/ do
  admin_visits "/expos/#{this_year}"
end

When /^I click on the PDFs link$/ do
  click_link "(PDFs)"
end

When /^I click on the tags link$/ do
  click_link "Etiquetas"
end