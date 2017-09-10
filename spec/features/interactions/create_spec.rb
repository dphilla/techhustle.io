require 'rails_helper'

feature "User" do
  scenario "can create a new interaction for a connection" do

    user = User.create(username: "Daniel", password: "something")                   #Refactor this setup in to before action

                                                                                    #Also, figure out how to really stub out the
                                                                                    #current user from ApplicationController instance

    visit login_path
    fill_in "session[username]", with: "Daniel"
    fill_in "session[password]", with: "something"
    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Hey, #{user.username}, let's grow your network")


    connection1 = user.connections.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy")
    connection2 = user.connections.create(name: "bret",
                                 initial_meet: "10/12/12",
                                 organization: "navy")


    create(:relationship)

    connection1.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection2.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")


    visit connections_path
    click_on "#{connection1.name}"                                                  #need to dry this up (lines 6-40)
    fill_in "interaction[date]", with: "10/10/12"
    fill_in "interaction[location]", with: "Galvanize"
    fill_in "interaction[event]", with: "Meet-up"
    fill_in "interaction[description]", with: "Spoke to him about blockchain and then, for some reason, about FDR"
    click_on "Create"

    expect(page).to have_content("Galvanize")
  end
end
