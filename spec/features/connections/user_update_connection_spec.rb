
require 'rails_helper'

RSpec.describe "user" do
  scenario "can update a connection" do


    user = User.create(username: "Daniel", password: "something")

    visit login_path
    fill_in "session[username]", with: "Daniel"
    fill_in "session[password]", with: "something"
    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Hey, #{user.username}, let's grow your network")


  connection = user.connections.create(name: "bret",
                                 initial_meet: "10/12/12",
                                 organization: "navy")
  connection2 = user.connections.create(name: "John",
                                 initial_meet: "10/12/12",
                                 organization: "navy")



    connection.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

  create(:relationship)

  visit connections_path

  first(:link, "Edit").click

  fill_in "Name", with: "Betty"
  fill_in "Initial meet", with: connection.initial_meet
  fill_in "Organization", with: connection.organization
  select Relationship.last.status, from: "connection[relationship_id]"
  click_on "Update"

  expect(page).to have_content("Betty")
  expect(current_path).to eq(connections_path)


  end
end
