class CasesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:client_id]
      @client = Client.find_by(id: params[:client_id])
      @open_cases = @client.open_cases
      @closed_cases = @client.closed_cases
    elsif params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @open_cases = @user.open_cases
      @closed_cases = @user.closed_cases
    else
      @open_cases = Case.open_cases
      @closed_cases = Case.closed_cases
    end
  end

  def new
    @case = Case.new
    @case.build_client
    @attributes = @case.form_attributes
  end

  def create
    if case_params[:client_id].empty?
      @case = Case.new(case_params)
    else
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
    @case = Case.find_by(id: params[:id])
    if policy(@case).update?
      @attributes = @case.form_attributes
    else
      flash[:message] = "Denied: non case_worker"
      redirect_to case_path(@case)
    end
  end

  def update
    @case = Case.find_by(id: params[:id])
    if policy(@case).update?
      @case.update(case_params)
      flash[:message] = "Case successfully updated"
      redirect_to case_path(@case)
    else
      flash[:message] = "Denied: non case_worker"
      redirect_to case_path(@case)
    end
  end

  def show
    @case = Case.find_by(id: params[:id])
    @attributes = @case.form_attributes.sort
    @lawyers = @case.attorneys
    @paras = @case.paralegals
    @case_notes = @case.notes.reverse
    @newnote = Note.new()
    @newnote.user = current_user
    @newnote.case = @case
  end

  def destroy
    @case = Case.find_by(id: params[:id])
    if policy(@case).destroy?
      @case.delete
      flash[:message] = "Case Successfully deleted"
      redirect_to cases_path
    else
      flash[:message] = "Only Admins many delete cases"
      redirect_to cases_path
    end
  end

  private

  def case_params
    params.require(:case).permit(:caption, :client_id, :county, :index_num, :open, :exposure, 
                                  :client_attributes => [:first_name, :last_name, :company_name, :home_phone, :work_phone, 
                                  :cell_phone, :email, :address, :city, :state, :zip], :case_workers => [])
  end

end
