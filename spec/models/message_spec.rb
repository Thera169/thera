require 'rails_helper'

RSpec.describe Message, type: :model do
  
  describe 'create a new Message' do
    it 'creates a new Message' do
      @message = Message.new
      expect(@message).to be_an_instance_of(Message)
    end
  end
  
  describe 'create a new Message with content' do
    it 'creates a new Message with content' do
      @message = Message.new(:content => "We did it!")
      expect(@message.content).to eq("We did it!")
    end
  end
  
end
