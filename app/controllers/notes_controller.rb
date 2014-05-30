class NotesController < ApplicationController
  before_action :set_notes, [:index, :edit]
  def index
  end

  def edit
    @note = Note.find params[:id]
    render :index
  end

  private
  def set_notes
    @notes = Note.all
  end
end
