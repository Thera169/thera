require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:conversation) { create(:conversation) }
  let(:message_1) { create(:message, conversation: conversation) }
  let(:message_2) { create(:message, conversation: conversation) }

  it do
    is_expected.
      to belong_to(:sender).
      with_foreign_key(:sender_id).
      class_name('User')
  end

  describe ".last_message" do
    it "gets the last message" do
      expect(conversation.last_message).to eq message_2
    end
  end

  describe ".new_messages?" do
    it "chceks to see if there are any recent messages" do
      expect(conversation.new_messages?).to be true
    end

    it "returns false if there are not any new messages" do
      create(:message, conversation: conversation, created_at: Time.now - 20)

      expect(conversation.new_messages?).to be false
    end
  end
end
