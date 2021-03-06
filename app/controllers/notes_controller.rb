class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_notebook, only: [:index, :new, :create]

  # GET /notebooks/:id/notes
  # GET /notebooks/:id/notes.json
  def index
    @notes = Note.all
    @page_title = "All Notes"
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @page_title = @note.title
  end

  # GET /notebooks/:id/notes/new
  def new
    @note = Note.new
    @page_title = "New Note"
  end

  # GET /notes/1/edit
  def edit
    @notebook = Note.find(params[:id]).notebook_id
    @page_title = "Editing #{@note.title}"
  end

  # POST /notebooks/:id/notes
  # POST /notebooks/:id/notes.json
  def create
    @note = Note.new(note_params)
    @note.notebook_id = @notebook.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @notebook = @note.notebook.id
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notebook_notes_url(@notebook), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end
    def set_notebook
      @notebook = Notebook.find(params[:notebook_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :body)
    end
end
