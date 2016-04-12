class UpdateMessages 

  def self.clean_up
    Message.all.each do |message| 
      if message.created_at < Date.yesterday
        message.destroy
      end
    end

  end
end