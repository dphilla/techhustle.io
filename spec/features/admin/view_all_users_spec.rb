require 'rails_helper'

feature "when a user visits the users page" do
  context  "as an admin" do
    scenario "they can see all users" do

     admin = User.create(username: "Sal", password_digest: "password", role: 1)

     #this stubs out the need to log in each time you check a current user
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

     visit admin_users_path

     expect(page).to have_content("All Users")
    end
  end
   context  "as an default user" do
    scenario "they can't see all users" do

     default = User.create(username: "Sal", password_digest: "password")

     #this stubs out the need to log in each time you check a current user
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)

     visit admin_users_path

     expect(page).to_not have_content("All Users")
    end
  end
end
