class ConnectionsController < ApplicationController
before_action :check_current_user

  def new
    @connection = Connection.new
  end

  def create
    @connection = Connection.new(connection_params)
    if @connection.save
      redirect_to @connection
    else
     redirect_to new_connection_path
    end
  end

  def show
    @connection = Connection.find(params[:id])
  end

  def index
    @connections = Connection.all
  end

  def edit
    @connection = Connection.find(params[:id])
  end

  def update
    @connection = Connection.find(params[:id])
    @connection.update(connection_params)
    redirect_to connections_path
  end

  def destroy
     connection = Connection.find(params[:id])
     connection.interactions.destroy_all
     connection.destroy
     flash[:message] = "Connection Deleted!"
     redirect_to connections_path
  end

private

  def connection_params
    params.require(:connection).permit(:name, :initial_meet, :organization, :relationship_id)
  end
end
