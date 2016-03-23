class CasesController < ApplicationController

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
    @attributes = @case.form_attributes.sort
  end

  def create
    @case = Case.new(case_params)
    @case.save
    redirect_to case_path(@case)
  end

  def show
    @case = Case.find_by(id: params[:id])
    @attributes = @case.form_attributes.sort
  end

  private

  def case_params
    params.require(:case).permit(:caption, :client_id, :county, :index_num, :open)
  end

end
