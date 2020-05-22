# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
env :PATH, ENV["PATH"]
set :job_template, "/bin/zsh -l -c ':job'"
set :output, "log/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# job_type :sidekiq, "cd :path && :environment_variable=:environment bundle exec sidekiq-client push :task :output"

# every 1.minutes, :roles => [:app] do
#   sidekiq "ReportMailerWorker", environment: :development
# end
every 1.days, at: "5:00 am" do
  rake "app:send_report", environment: :development
end

# Learn more: http://github.com/javan/whenever

