class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
    # @notes = policy_scope(Note)
    # if params[:query].present?
    #   # @notes = policy_scope(Note).where(title: params[:query])
    #   # @notes = policy_scope(Note).where("title ILIKE ?", "%#{params[:query]}%")
    #   # sql_query = "title ILIKE :query OR content ILIKE :query"
    #   sql_query = "title @@ :query OR content @@ :query"
    #   @notes = policy_scope(Note).where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @notes = policy_scope(Note)
    # end
    if params[:query].present?
      @notes = policy_scope(Note).search_by_title_and_content(params[:query])
    else
      @notes = policy_scope(Note)
    end
  end

  def show
  end

  def new
    @note = Note.new
    authorize @note
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    authorize @note
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @note.update(note_params)
    if @note.save
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    @note.delete
    redirect_to notes_path
  end

  private

  def find_note
    @note = Note.find(params[:id])
    authorize @note
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
