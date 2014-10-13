class NotesController < ApplicationController
  before_action :set_folder
  before_action :set_notes

  def index
    @note = Note.new
  end

  def edit
    @note = scope.find params[:id]
    render :index
  end

  def create
    note = scope.new note_params
    respond_to do |format|
      if note.save!
        format.html {redirect_to root_path}
      else
        format.html {flash[:notice] = 'Deu erro bonitao'}
      end
    end
  end

  def destroy
    note = scope.find params[:id]
    note.destroy!
    @teste = 'passou por aqui'
    redirect_to notes_path
  end

  def update
    @note = scope.find params[:id]
    @note.update(note_params)

    render :index
  end

  def new
    @note = scope.new
    render :index
  end

  private
  def set_notes
    @notes = @folder.notes.order(:created_at).reverse_order
  end

  def set_folder
    @folder = Folder.find(params[:folder_id])
  end

  def scope
    @folder
  end

  def note_params
    params.require(:note).permit(:titulo, :texto)
  end
end
