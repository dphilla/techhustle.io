class DashboardController < ApplicationController


  def index
    @other_users = User.sort_by_mutual_connections(current_user)
  end


  def show
  end

end