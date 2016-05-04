class NotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @notes = Note.where(case_id: (params['case_id'].to_i))
    render json: @notes
  end

  def create
    note = Note.new(note_params)
    if note.save
      redirect_to case_path(note.case)
    else
      flash[:alert] = "Invalid Note"
      redirect_to case_path(note.case)
    end
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    if policy(@note).update?
      #authorize @note kept getting error i couldnt debug.
      @note.update(note_params)
      flash[:message] = "You note has been updated"
      redirect_to case_path(@note.case)
    else
      flash[:message] = "Non admin: You may only edit your own notes"
      redirect_to case_path(@note.case)
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    @case = @note.case
    if policy(@note).destroy?
       #tried using pundit here via authorize @note but kept getting error i couldnt debug.
      @note.delete
      flash[:message] = "You note has been deleted"
      redirect_to case_path(@case)
    else
      flash[:message] = "Non admin: You may only delete your own notes."
      redirect_to case_path(@note.case)
    end


  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :case_id)
  end
end
