class Case < ActiveRecord::Base
  include FormHelper
  
  belongs_to :client
  validates :client, presence: true


  def self.popular_county
    group(:county).count(:county).max_by {|county, num| num}
  end
end
