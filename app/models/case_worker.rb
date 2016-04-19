class CaseWorker < ActiveRecord::Base

  belongs_to :worker, foreign_key: "user_id", class_name: "User"
  belongs_to :case
  
  validates_uniqueness_of :case_id, :scope => :user_id
end