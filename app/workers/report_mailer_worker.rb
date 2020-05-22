class ReportMailerWorker
  include Sidekiq::Worker
  
  def perform(*args)
    ReportsMailer.daily_report.deliver
  end
end