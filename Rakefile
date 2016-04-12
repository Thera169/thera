# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


desc "delete messages that are over a day old"
task :dump_old_messages => :environment do
  UpdateMessages.clean_up
end

# desc "check for expired elections, tally expired elections and email"
# task :tally_and_email_guests => :environment do
#   DailyTally.tally_and_email
# end


