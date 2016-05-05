class Case < ActiveRecord::Base
  include FormHelper
  
  belongs_to :client
  validates :client, presence: true

  has_many :case_workers
  has_many :workers, through: :case_workers, class_name: User

  has_many :notes
  has_many :note_authors, through: :notes, source: :user

  accepts_nested_attributes_for :client

  def client_attributes=(client_attributes)
    self.client = Client.find_or_create_by(first_name: client_attributes[:first_name],last_name: client_attributes[:last_name])
    self.client.update(client_attributes)
  end

  def case_workers=(case_workers)
    case_workers.each do |c|
      self.case_workers.build(user_id: c.to_i, case_id: self.id) unless c.empty?
    end
  end

  def self.popular_county
    group(:county).count(:county).max_by {|county, num| num}
  end

  def self.case_with_most_notes
    Case.all.sort_by {|a| a.notes.count }.last
  end
end
