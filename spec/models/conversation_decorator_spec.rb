require 'rails_helper'

RSpec.describe ConversationDecorator do
  describe ".convos" do
    let(:sender) { create(:user) }
    let(:recipient) { create(:user) }
    let(:convo) { Conversation.create(sender: sender, recipient: recipient) }

    it "should set an array of conversations" do
      convo.messages = [Message.new(user: sender, body: "Hello")]

      @decorated_conversation = ConversationDecorator.new(recipient)

      expect(@decorated_conversation.convos).to eq [convo]
    end

    it "should return true if there are any new messages" do
      convo.messages = [Message.new(user: sender, body: "Sup, Bro?")]

      @decorated_conversation = ConversationDecorator.new(recipient)

      expect(@decorated_conversation.updated?).to eq true
    end
  end
end

