require 'rails_helper'

feature "User"do
  it "can see an individual connection" do

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

    visit connection_path(connection1)


    expect(current_path).to eq(connection_path(connection1))
    expect(page).to have_content("#{connection1.name}")
    expect(page).to_not have_content("#{connection2.name}")
  end
end
