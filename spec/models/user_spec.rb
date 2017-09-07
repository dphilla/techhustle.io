require 'rails_helper'

RSpec.describe User, type: :model do

  it "can be created as an admin" do

  user = User.create(username: "Penelope", password: "boom", role: 1)

  expect(user.role).to eq("admin")
 end

  it "can be created as a user" do

  user = User.create(username: "Penelope", password: "boom")

  expect(user.role).to eq("default")
  end

end
