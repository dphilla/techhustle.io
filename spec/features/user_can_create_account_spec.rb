require 'rails_helper'

RSpec.describe "User can create a new account" do
  it "visit new_user_path" do
    user_attributes = {username: "Daniel", password: "password"}

    visit new_user_path
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Create Profile"

    user = User.last

    expect(page).to have_content("Hey, #{user.username}, let's grow
                                  your network, eh?")
    expect(current_path).to eq(user_path(user))
  end
end
