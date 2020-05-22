class ReportsMailer < ApplicationMailer
  def daily_report
    @urls = Url.order(pinned: :desc, created_at: :desc)
    mail to: 'chahar.shivam@yahoo.com', subject: 'Ur.ly Daily Report'
  end
end
