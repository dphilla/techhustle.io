class DashboardController < ApplicationController


  def index
    @other_users = User.sort_by_mutual_connections(current_user)
    @profiles = Profile.profile_collection
  end


  def show
  end

end
