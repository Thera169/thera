require 'rails_helper'

RSpec.describe Conversation, type: :model do
		
	describe 'new' do
		it "creates a new conversation" do      
			@conversation = Conversation.new
			expect(@conversation).to be_an_instance_of(Conversation)
		end
	end
		
	describe 'create new conversation with id' do
		it "creates a new conversation with id" do
			@conversation = Conversation.new(:id => 5318008)
			expect(@conversation.id).to eq(5318008)
		end
	end
	
end
