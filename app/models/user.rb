class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :cases, through: :case_workers

  has_many :notes
  has_many :notated_cases, through: :notes, source: :case

  def full_name
    self.first_name + " " + self.last_name
  end
  
end
