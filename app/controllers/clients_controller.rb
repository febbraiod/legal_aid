class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = Client.all
    respond_to do |format|
    format.html { render :index }
    format.json { render json: @clients }
    end
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
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @client }
    end
  end

  def edit
    @client = Client.find_by(id: params[:id])
    @attributes = @client.form_attributes
    if !policy(@client).edit?
      flash[:message] = "Non admins may not update clients"
      redirect_to client_path(@client)
    end
  end

  def update
    @client = Client.find_by(id: params[:id])
    if policy(@client).update?
    @client.update(client_params)
    redirect_to client_path(@client)
    else
      flash[:message] = "Non admins may not update clients"
      redirect_to client_path(@client)
    end
  end

  def destroy
    @client = Client.find_by(id: params[:id])
    if policy(@client).destroy?
      flash[:message] = "Client Deleted"
      @client.destory
      redirect_to clients_path
    else
      flash[:message] = "Only admins may delete clients"
      redirect_to clients_path
    end
  end


    private

    def client_params
      params.require(:client).permit(:first_name, :last_name, :company_name, :home_phone, :work_phone, 
                                     :cell_phone, :email, :address, :city, :state, :zip)
    end

end