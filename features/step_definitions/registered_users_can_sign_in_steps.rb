Given /^I have signed out of the application$/ do
  sign_out
end

When /^provide my user credentials$/ do
  fill_in "user_email", with: user_email
  fill_in "user_password", with: "please"
  click_button "Ingresar"
end