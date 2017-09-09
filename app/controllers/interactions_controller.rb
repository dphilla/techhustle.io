class InteractionsController < ApplicationController
before_action :check_current_user
before_action :sets_user_connection

  def new
    @interaction = @connection.interactions.new
  end

  def create
    interaction = @connection.interactions.new(interaction_params)
    if interaction.save
      redirect_to connection_path(@connection)
    else
      render :new
    end
  end

  def index
    @interaction = @connection.interactions.all
  end

  private

  def interaction_params
    params.require(:interaction).permit(:date, :location, :event, :description)
  end




end
