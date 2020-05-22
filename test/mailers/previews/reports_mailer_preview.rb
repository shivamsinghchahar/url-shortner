# Preview all emails at http://localhost:3000/rails/mailers/reports_mailer
class ReportsMailerPreview < ActionMailer::Preview
  def daily_report
    ReportsMailer.daily_report
  end
end
