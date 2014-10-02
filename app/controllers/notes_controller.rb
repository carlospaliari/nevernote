class NotesController < ApplicationController
  before_action :set_notes, [:index, :save, :destroy]
  def index
    @note = Note.new
  end

  def edit
    @note = Note.find params[:id]
    render :index
  end

  def create
    note = Note.new note_params
    respond_to do |format|
      if note.save!
        format.html {redirect_to root_path}
      else
        format.html {flash[:notice] = 'Deu erro bonitao'}
      end
    end
  end

  def save
    @notes = Note.all
  end

  def destroy
    note = Note.find params[:id]
    note.destroy!
    @teste = 'passou por aqui'
    redirect_to notes_path
  end

  def update
    @note = Note.find params[:id]
    @note.update(note_params)

    render :index
  end

  def new
    @note = Note.new
    render :index
  end

  private
  def set_notes
    @notes = Note.all.order(:created_at).reverse_order
  end

  def note_params
    params.require(:note).permit(:titulo, :texto)
  end
end
