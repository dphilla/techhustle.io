class DashboardController < ApplicationController


  def index

  end


  def show
    @hustlers = User.sort_by_mutual_connections(current_user.id)
  end

end
