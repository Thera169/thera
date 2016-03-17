class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  
  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "Survivor" if self.role.nil?
  end
end
