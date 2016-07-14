class CaseSerializer < ActiveModel::Serializer
  attributes :client_name, :index_num, :county, :caption, :open, :created_at, :updated_at, :exposure
  # has_one :client

  def client_name
    object.client.full_name
  end
end
