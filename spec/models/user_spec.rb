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

  it "can check from oauth" do

  user = User.create(username: "Penelope", password: "boom")


  oauthed_user = User.from_omniauth(user)

  User.sort_by_mutual_connections(User.last)

  end
end
