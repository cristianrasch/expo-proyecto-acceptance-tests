Given /^I am at the sign\-up page$/ do
  visit "/users/sign_up"
end

When /^I register a new account$/ do
  within("#user_new") do
    fill_in "user_email", with: user_email
    fill_in "user_password", with: "please"
    fill_in "user_password_confirmation", with: "please"
    click_on "Registrarse"
  end
end

Then /^I should be signed in$/ do
  find('li#current_session').should have_link("Salir")
end

def user_email
  @user_email ||= "cucumber#{Time.now.to_i}@example.org"
end