class Conversation < ActiveRecord::Base

  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

  has_many :messages
  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :involving, -> (user) do
    where("conversations.sender_id = ?", user)
  end

  scope :involving_id, -> (user_id) do
    where("conversations.sender_id = ?", user_id)
  end

  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id = ?) OR (conversations.sender_id = ? AND conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end

  def self.get_conversation_survivor(sender_id, recipient_id)
    if Conversation.involving_id(sender_id).present?
      conversation = Conversation.involving_id(sender_id).first
    elsif Conversation.between(sender_id, recipient_id).present?
      conversation = Conversation.between(sender_id, recipient_id).first
    else
      conversation = Conversation.create!(:recipient_id => recipient_id,
                                          :sender_id => sender_id)
    end
  end


  def self.get_conversation(sender_id, recipient_id)
    if Conversation.between(sender_id, recipient_id).present?
      conversation = Conversation.between(sender_id, recipient_id).first
    else
      conversation = Conversation.create!(:recipient_id => recipient_id,
                                          :sender_id => sender_id)
    end
  end

  def last_message
    last_message = messages.last
    last_message
  end

  def new_messages?
    if last_message
      last_message().created_at.to_time > Time.now.to_date - 10
    else
      false
    end
  end
end
