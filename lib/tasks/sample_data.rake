namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    user = Timecard.create!(:user_id => 1,
                     :volunteer_date => Time.now,
                     :start_time => Time.now,
                     :end_time => Time.now + (3600*4))
    
    99.times do |n|

      user_id = n + user.user_id
      volunteer_date = Time.now + (3600*(24+n))
      start_time = volunteer_date
      end_time = start_time + (3600*4)

      Timecard.create!(:user_id => user_id,
                       :volunteer_date => volunteer_date,
                       :start_time => start_time,
                       :end_time => end_time)
                        

    end
  end
end

