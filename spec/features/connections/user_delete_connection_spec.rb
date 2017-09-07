require 'rails_helper'

RSpec.describe "user" do
  scenario "can delete a connection" do


  connection = Connection.create(name: "brett",
                                 initial_meet: "10/12/12",
                                 organization: "navy")


    connection.interactions.create(date: "10/10/10", event: "code demo",
                                     location: "turing",
                                     description: "just some bs")

  visit connections_path
  expect(page).to have_content("Delete Connection")

  click_on "Delete Connection"

  expect(page).to have_content("Connection Deleted!")
  expect(current_path).to eq(connections_path)


  end
end
