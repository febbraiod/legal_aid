class CaseWorker < ActiveRecord::Base

  belongs_to :user, as: :worker
  belongs_to :case
  
end
