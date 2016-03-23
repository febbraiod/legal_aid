class Case < ActiveRecord::Base
  include FormHelper
  
  belongs_to :client
  validates :client, presence: true
end
