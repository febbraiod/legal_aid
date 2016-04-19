class CaseWorker < ActiveRecord::Base

  belongs_to :worker, class_name: :user
  belongs_to :case
  
  validates_uniqueness_of :case_id, :scope => :user_id
end