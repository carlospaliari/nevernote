class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def edit
    index
    render :index
  end
end
