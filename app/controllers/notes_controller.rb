class NotesController < ApplicationController
  before_action :set_notes, [:index, :edit, :save]
  def index
  end

  def edit
    @note = Note.find params[:id]
    render :index
  end

  def save
    @notes = Note.all
  end

  def update
    @note = Note.find params[:id]
    @note.update(note_params)
    render :index
  end

  private
  def set_notes
    @notes = Note.all
  end

  def note_params
    params.require(:note).permit(:titulo, :texto)
  end
end
