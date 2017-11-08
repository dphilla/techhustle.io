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


    connection1 = user.connections.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy",
                                 relationship_id: Relationship.last.id)
    connection2 = user.connections.create(name: "bret",
                                 initial_meet: "10/12/12",
                                 organization: "navy",
                                 relationship_id: Relationship.last.id)



    connection1.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection1.interactions.create(date: "10/10/10", event: "free pizza",
                                     location: "turing",
                                     description: "just some bs")


    visit connections_path
    click_on "#{connection1.name}"                                                  #need to dry this up (lines 6-40)
    expect(page).to have_content("free pizza")

  end
end
