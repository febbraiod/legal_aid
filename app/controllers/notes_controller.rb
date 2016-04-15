class NotesController < ApplicationController

  def create
    note = Note.new(note_params)
    if note.save
      redirect_to case_path(note.case)
    else
      flash[:alert] = "Invalid Note"
      redirect_to case_path(note.case)
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :user_id, :case_id)
  end
end
