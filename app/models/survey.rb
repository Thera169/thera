class Survey < ActiveRecord::Base
	belongs_to :conversation
	has_one :survey
end
