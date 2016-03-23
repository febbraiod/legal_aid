class Client < ActiveRecord::Base
  include FormHelper
  
  has_many :cases
end
