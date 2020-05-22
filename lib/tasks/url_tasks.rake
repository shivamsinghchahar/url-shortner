namespace :app do
  routes = Rails.application.routes.url_helpers
  session = ActionDispatch::Integration::Session.new(Rails.application)

  desc "Encode the given URL"
  task encode: :environment do
    res = session.post routes.encode_urls_path, params: { url: { original: ENV['URL'] } }
    data = JSON.parse(session.response.body)

    if res == 200
      puts "The shortened url of #{ENV['URL']} is #{data["shortened_url"]}"
    else
      puts data["errors"]
    end
  end

  desc "Decode the given URL"
  task decode: :environment do
    res = session.get routes.decode_url_path(ENV['SHORTURL'].last(8))
    data = JSON.parse(session.response.body)

    if res == 200
      puts "The original url of short url #{ENV['SHORTURL']} is #{data['url']['original']}"
    else
      puts "No original url was found for the  short url #{ENV['SHORTURL']}"
    end
  end

  desc "Daily reports"
  task send_report: :environment do
    ReportMailerWorker.perform_async    
  end
end
