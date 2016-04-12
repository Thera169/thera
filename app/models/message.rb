class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  #delegate :user, :to => :conversation,

  validates_presence_of :body, :conversation_id, :user_id
end
