class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_one :conversation, :dependent => :destroy
  
  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "Survivor" if self.role.nil?
  end
  
  def self.new_survivor
    role = Role.where(:name => "Survivor").first
    pw = (0...8).map { (30 + rand(26)).chr }.join
    email = (0...8).map { (30 + rand(26)).chr }.join 
    user = User.create(:name => "anon", 
                           :role_id => role.id,
                           :email => email,
                           :password => pw,
                           :password_confirmation => pw)
    return user
  end

  def generate_conversation
    if survivor? or admin?
        self.conversation = Conversation.create()
        message = self.conversation.messages.build(content: "Your chat has started.",
                                                  conversation_id: self.conversation.id)
        if conversation.save() and message.save()
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
    puts(self.role.name)
    self.role.name == "Volunteer"
  end

  
  def survivor?
    self.role.name == "Survivor"
  end

end
