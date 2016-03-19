class AddUserToConversation < ActiveRecord::Migration
  def change
    add_reference :conversations, :user, index: true, foreign_key: true
  end
end
