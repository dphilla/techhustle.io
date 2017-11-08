require 'rails_helper'

feature "User" do
  scenario "can create a new interaction for a connection" do

    user = User.create(username: "Daniel", password: "something")                   #Refactor this setup in to before action
    create(:relationship)

                                                                                    #Also, figure out how to really stub out the
                                                                                    #current user from ApplicationController instance

    visit login_path
    fill_in "session[username]", with: "Daniel"
    fill_in "session[password]", with: "something"
    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Hey, #{user.username}")

    click_on "Logout"
  end
end
