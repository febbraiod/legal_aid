class User < ActiveRecord::Base
  enum role: [:para, :lawyer, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, 
         :trackable, :validatable, :registerable

  validates :first_name, :last_name, presence: true 
  
  has_many :case_workers
  has_many :cases, through: :case_workers

  has_many :notes
  has_many :notated_cases, through: :notes, source: :case

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :para
  end

  def full_name
    self.first_name + " " + self.last_name
  end
  
  #overriding devise in order to implement admin authorization
  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

end
