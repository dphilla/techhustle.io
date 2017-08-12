class ConnectionsController < ApplicationController

  def new
    @connection = Connection.new
  end

  def create
    @connection = Connection.new(connection_params)
    if @connection.save! && current_user
      redirect_to @connection
    else
     flash[:warning] = "You gotta sign in to grow your network!"
     redirect_to new_connection_path
    end
  end

  def show
    @connection = Connection.find(params[:id])
  end

  def index
    @connections = Connection.all
  end

  def destroy
     connection = Connection.find(params[:id])
     connection.contact_points.destroy_all
     connection.destroy
     flash[:message] = "Connection Deleted!"
     redirect_to connections_path
  end

private

  def connection_params
    params.require(:connection).permit(:name, :initial_meet, :organization)
  end
end
