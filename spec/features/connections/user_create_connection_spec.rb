require 'rails_helper'

RSpec.describe "user" do
  it "can create a new connection" do
    user = User.create(username: "Daniel", password: "something")

    visit login_path
    fill_in "session[username]", with: "Daniel"
    fill_in "session[password]", with: "something"
    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Hey, #{user.username}, let's grow your network")


    connection = Connection.create(name: "brett",
                                   initial_meet: "10/12/12",
                                   organization: "navy")

    connection.contact_points.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    visit new_connection_path
    current_user = user

    fill_in "Name", with: connection.name
    fill_in "Initial meet", with: connection.initial_meet
    fill_in "Organization", with: connection.organization
    fill_in "Relationship", with: "acquantance"
    click_on "Create New Connection"

    expect(current_path).to eq(connection_path(Connection.last.id))
    expect(page).to have_content("#{connection.name}")

  end
end

