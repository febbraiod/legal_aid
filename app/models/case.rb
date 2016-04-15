class Case < ActiveRecord::Base
  include FormHelper
  
  belongs_to :client
  validates :client, presence: true

  has_many :workers, through: :case_workers, source: :user

  has_many :notes
  has_many :note_authors, through: :notes, source: :user


  def self.popular_county
    group(:county).count(:county).max_by {|county, num| num}
  end
end
