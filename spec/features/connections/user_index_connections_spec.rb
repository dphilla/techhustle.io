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


    connection1 = Connection.create(name: "Brett",
                                   initial_meet: "10/12/12",
                                   organization: "Navy")

    connection2 = Connection.create(name: "John",
                        initial_meet: "10/12/14",
                        organization: "Navy")

    create(:relationship)

    connection1.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection2.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    visit connections_path

    current_user = user


    expect(current_path).to eq(connections_path)
    expect(page).to have_content("#{connection2.name}")
    expect(page).to have_content("#{connection2.name}")
  end
end
