class ConnectionsController < ApplicationController
before_action :current_user
before_action :check_current_user

  def new
    @connection = @user.connections.new
  end

  def create
    @connection = @user.connections.new(connection_params)
    if @connection.save
      @user.connections << @connection #why do I have to do this???????????????????????????? (I can do it in the console with shoveling)
      redirect_to connection_path(@connection)
    else
     redirect_to new_connection_path
    end
  end

  def show
    @connection = @user.connections.find(params[:id])
  end

  def index
    @connections = @user.connections.all
  end

  def edit
    @connection = @user.connections.find(params[:id])
  end

  def update
    @connection = @user.connections.find(params[:id])
    @connection.update(connection_params)
    redirect_to connections_path
  end

  def destroy
     connection = @user.connections.find(params[:id])
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
