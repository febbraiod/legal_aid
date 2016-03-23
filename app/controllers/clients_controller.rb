class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
    @attributes = @client.form_attributes
  end

  def create
    @client = Client.new(client_params)
    @client.save
    redirect_to client_path(@client)
  end

  def show
    @client = Client.find_by(id: params[:id])
    @attributes = @client.form_attributes
  end

  def edit
  end

  def update
  end

  def destory
  end

    private

    def client_params
      params.require(:client).permit(:first_name, :last_name, :company_name, :home_phone, :work_phone, 
                                     :cell_phone, :email, :address, :city, :state, :zip)
    end

end