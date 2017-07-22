require 'rails_helper'

RSpec.describe "User can create a new account" do
  context "with valid attributes" do
    user_attributes = {username: "Daniel", password: "password"}

    visit user_new_path
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Create Profile"

    user = User.last

    expect(page).to have_content("Welcome to Net.work, #{user.username}. Let's grow
                                  your connections")
    expect(current_path).to eq(user_show_path)
  end
end
