require 'rails_helper'

RSpec.describe "user visits users index" do
  context "as an admin" do
    it "should display all users on app" do
      admin = User.create(username: "Daniel", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


      visit admin_users_path
      expect(page).to have_content("All Users")
    end
  end
end
