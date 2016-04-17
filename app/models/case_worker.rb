class CaseWorker < ActiveRecord::Base

  belongs_to :worker, class_name: :user
  belongs_to :case
  
end
