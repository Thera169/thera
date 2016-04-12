require 'rails_helper'

RSpec.feature 'Authentication Feature' do
  scenario "A user signs in" do
    create(:user)

    visit root_path
    fill_in "user_email", with: "user@example.com"
    fill_in "user_password", with: "icecream"
    click_on "Log in"

    expect(page).to have_content "Sign out"
  end

  scenario "A new user signs up" do
    visit root_path

    click_on "Sign up"
    expect(page).to have_content "Sign up"
    fill_in "user_name", with: "Test Guy"
    fill_in "user_email", with: "test@email.com"
    fill_in "user_password", with: "icecream"
    fill_in "user_password_confirmation", with: "icecream"
    click_on "Sign up"

    expect(page).to have_content "avatar"
  end
end
