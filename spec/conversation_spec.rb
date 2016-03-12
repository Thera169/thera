require 'spec_helper'

describe Conversation do

  describe 'new' do
    it "creates a new conversation" do      
        @conversation = Conversation.new
        expect(@conversation).to be_an_instance_of(Conversation)

    end
  end
 
end