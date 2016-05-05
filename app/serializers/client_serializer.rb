class ClientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :company_name, :home_phone, :work_phone, :cell_phone, :email, :address, :city, :state, :zip
end
