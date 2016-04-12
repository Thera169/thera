class AddDefaultValueToLastSeen < ActiveRecord::Migration
  def change
    change_column :users, :last_seen, :datetime, :default => Time.now
  end
end
