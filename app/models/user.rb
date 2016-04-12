class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :conversations, :dependent => :destroy, foreign_key: :sender_id
  validates_presence_of :name
  validates_confirmation_of :password
  before_save :assign_role
  
  # after_create :add_avatar

  # def add_avatar
  #   self.avatar = Faker::Avatar.image("my-own-slug", "100x100", "jpg")
  #   self.save
  # end

  def assign_role
    self.role = Role.find_by name: "Survivor" if self.role.nil?
  end
  
  def self.new_survivor
    rand = (0...8).map { (30 + rand(26)).chr }.join 
    user = User.create(:name => "anon", :role_id => User.get_role("Survivor").id, :email => rand, :password => rand, :password_confirmation => rand)
    return user
  end
  
  def self.find_available_volunteer
    volunteer_role = User.get_role("Volunteer")
    return User.where(:role_id => volunteer_role.id).sample
  end


  def self.admin_make_user(args)
    role = User.get_role(args[:role_id])
    return User.create!(:name => args[:name], :role_id => role.id, :email => args[:email], :password => args[:password], :password_confirmation => args[:password_confirmation])
  end

  def self.get_role(name)
    Role.where(:name => name).first
  end

  def generate_conversation
    self.conversation = Conversation.create!() if (survivor? or admin?)
    return self.conversation
  end

  def admin?
    self.role.name == "Admin"
  end
  def volunteer?
    self.role.name == "Volunteer"
  end
  def survivor?
    self.role.name == "Survivor"
  end
end
