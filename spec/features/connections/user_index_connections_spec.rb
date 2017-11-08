require 'rails_helper'

feature "user" do
  it "can see index of connection" do
    user = User.create(username: "Daniel", password: "something")
    create(:relationship)

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
    connection2 = user.connections.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy",
                                 relationship_id: Relationship.last.id)


    create(:relationship)

    connection1.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    connection2.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

    visit connections_path

    expect(current_path).to eq(connections_path)
    expect(page).to have_content("#{connection2.name}")
    expect(page).to have_content("#{connection2.name}")
  end
end
