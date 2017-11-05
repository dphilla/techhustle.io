class NotesController < ApplicationController

  def new

  end

  def create
    require 'pry'; binding.pry
    connection = Connection.find(params[:connection_id])
    if connection.notes.create(note_params)
      redirect_to connection_path(connection)
    else
      render connection_path(connection)
      flash[:warning] = "note not created"
    end
  end

  def show

  end

  def index

  end

  private

    def note_params
      params.require(:note).permit(:content, :date)
    end
end
