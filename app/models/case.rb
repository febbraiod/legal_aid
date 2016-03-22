class Case < ActiveRecord::Base
  validates :client_id, presence: true

  belongs_to :client
end
