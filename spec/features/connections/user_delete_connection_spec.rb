require 'rails_helper'

RSpec.describe "user" do
  scenario "can delete a connection" do

  #user = create(:user)

  #allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #allow_any_instance_of(ApplicationController).to receive(:check_current_user).and_return(user)  # play with this

    user = User.create(username: "Daniel", password: "something")

    visit login_path
    fill_in "session[username]", with: "Daniel"
    fill_in "session[password]", with: "something"
    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Hey, #{user.username}, let's grow your network")


  connection = user.connections.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy")
  connection2 = user.connections.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy")



    connection.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

  visit connections_path
  expect(page).to have_content("Delete Connection")

  first(:link, "Delete Connection").click

  expect(page).to have_content("Connection Deleted!")
  expect(current_path).to eq(connections_path)


  end
end
