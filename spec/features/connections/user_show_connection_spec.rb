require 'rails_helper'

feature "User"do
  it "can see an individual connection" do

    user = User.create(username: "Daniel", password: "something")
    create(:relationship)

    visit login_path
    fill_in "session[username]", with: "Daniel"
    fill_in "session[password]", with: "something"
    click_on "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Hey, #{user.username}")


  connection = user.connections.create(name: "bret",
                                 initial_meet: "10/12/12",
                                 organization: "navy",
                                 relationship_id: Relationship.last.id)
  connection2 = user.connections.create(name: "John",
                                 initial_meet: "10/12/12",
                                 organization: "navy",
                                 relationship_id: Relationship.last.id)



    connection.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    visit connection_path(connection)


    expect(current_path).to eq(connection_path(connection))
    expect(page).to have_content("#{connection.name}")
    expect(page).to_not have_content("#{connection2.name}")
  end
end
