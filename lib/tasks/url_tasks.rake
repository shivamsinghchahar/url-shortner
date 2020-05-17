namespace :app do
  routes = Rails.application.routes.url_helpers
  session = ActionDispatch::Integration::Session.new(Rails.application)

  desc "Encode the given URL"
  task encode: :environment do
    res = session.post routes.urls_path, params: { url: { original_url: ENV['URL'] } }
    data = JSON.parse(session.response.body)

    if res == 200
      puts "The shortened url of #{ENV['URL']} is #{data["shortened_url"]}"
    else
      puts data["errors"]
    end
  end

  desc "Decode the given URL"
  task decode: :environment do
    res = session.get routes.url_path(ENV['SHORTURL'].last(8))
    data = JSON.parse(session.response.body)

    if res == 200
      puts "The original url of short url #{ENV['SHORTURL']} is #{data['url']['original_url']}"
    else
      puts "No original url was found for the  short url #{ENV['SHORTURL']}"
    end
  end
end
