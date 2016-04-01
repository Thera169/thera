class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  #:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_one :conversation, :dependent => :destroy
  
  validates_presence_of :name
  validates_confirmation_of :password

  before_save :assign_role

  
  def assign_role
    self.role = Role.find_by name: "Survivor" if self.role.nil?
  end
  
  def self.new_survivor
    role = User.get_role("Survivor")
    pw = (0...8).map { (30 + rand(26)).chr }.join
    email = (0...8).map { (30 + rand(26)).chr }.join 
    user = User.create(:name => "anon", 
                           :role_id => role.id,
                           :email => email,
                           :password => pw,
                           :password_confirmation => pw)
    return user
  end
  
  def self.admin_make_user(args)
    role = nil
    error = ""
    if args[:role_id].downcase == "volunteer"
      role = User.get_role("Volunteer")
    elsif args[:role_id].downcase == "admin"
      role = User.get_role("Admin")
    end
    role_id = role.id if not role.nil? else Role.where(name: "Survivor").first.id
    return User.create!(:name => args[:name], :role_id => role_id,
                        :email => args[:email], :password => args[:password],
                        :password_confirmation => args[:password_confirmation])
  end

  def self.get_role(name)
    Role.where(:name => name).first
  end

  def generate_conversation
    if survivor? or admin?
        self.conversation = Conversation.create()
        if conversation.save() 
          return conversation
        end
        return nil
    else
      nil
    end
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
