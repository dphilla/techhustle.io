
require 'rails_helper'

RSpec.describe "user" do
  scenario "can update a connection" do


  connection = Connection.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy")

  connection.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")
  create(:relationship)

  visit connections_path

  click_on "Edit"

  fill_in "Name", with: "Betty"
  fill_in "Initial meet", with: connection.initial_meet
  fill_in "Organization", with: connection.organization
  select Relationship.last.status, from: "connection[relationship_id]"
  click_on "Update"

  expect(page).to have_content("Betty")
  expect(current_path).to eq(connections_path)


  end
end
