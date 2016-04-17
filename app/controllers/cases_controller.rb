class CasesController < ApplicationController
  before_action :authenticate_user!
  
  #need to find a way to get a route for open case v. all cases.

  def index
    if params[:client_id]
      @client = Client.find_by(id: params[:client_id])
      @cases = @client.cases
    else
      @cases = Case.all
    end
  end

  def new
    @case = Case.new
    @attributes = @case.form_attributes
  end

  def create
    binding.pry

    @case = Case.new(case_params)
    if @case.save
      redirect_to case_path(@case)
    else
      flash[:message] = "Cases must be associated with a client"
      redirect_to new_case_path
    end
  end

  def edit
    @case = Case.find_by(params[:id])
    @attributes = @case.form_attributes
  end

  def update
    @case = Case.find_by(params[:id])
    @case.update(case_params)
    redirect_to case_path(@case)
  end

  def show
    @case = Case.find_by(id: params[:id])
    @attributes = @case.form_attributes.sort

    @case_notes = @case.notes.reverse
    @newnote = Note.new()
    @newnote.user = current_user
    @newnote.case = @case
  end

  private

  def case_params
    params.require(:case).permit(:caption, :client_id, :county, :index_num, :open, :exposure,:client => [:first_name, :last_name, :company_name, :home_phone, :work_phone, 
                                     :cell_phone, :email, :address, :city, :state, :zip], :case_workers => [])
  end

end
