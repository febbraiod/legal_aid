class CasesController < ApplicationController
  before_action :authenticate_user!
  
  #need to have a route for open cases v. all cases v. closed cases.

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
    @case.build_client
    @attributes = @case.form_attributes
  end

  def create
    if case_params[:client_id].empty?
      binding.pry
      @case = Case.new(case_params)
    else
      binding.pry
      @case = Case.new(case_params) 
      @case.client = Client.find_by(case_params[:client_id])
    end

    if @case.save
      flash[:message] = "Case successfully created"
      redirect_to case_path(@case)
    else
      flash[:message] = "Error: Cases must be associated with a client"
      redirect_to new_case_path
    end
  end

  def edit
    @case = Case.find_by(params[:id])
    @attributes = @case.form_attributes
  end

  def update
    @case = Case.find_by(params[:id])
    if @case.update(case_params)
      flash[:message] = "Case successfully updated"
      redirect_to case_path(@case)
    else
      flash[:message] = "Error, please try again."
      redirect_to case_path(@case)
    end
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
    params.require(:case).permit(:caption, :client_id, :county, :index_num, :open, :exposure, 
                                  :client_attributes => [:first_name, :last_name, :company_name, :home_phone, :work_phone, 
                                  :cell_phone, :email, :address, :city, :state, :zip], :case_workers => [])
  end

end
