class AddContentToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :content, :string
    add_column :messages, :conversation_id, :integer
  end
end
