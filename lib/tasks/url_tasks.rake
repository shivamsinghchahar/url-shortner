namespace :app do
  routes = Rails.application.routes.url_helpers
  session = ActionDispatch::Integration::Session.new(Rails.application)

  desc "Encode the given URL"
  task encode: :environment do
    session.post routes.urls_path, params: { url: { original_url: ENV['URL'] } }
    res = JSON.parse(session.response.body)

    if res["success"]
      puts "The shortened url of #{ENV['URL']} is #{res["shortened_url"]}"
    else
      puts res["errors"]
    end
  end

  desc "Decode the given URL"
  task decode: :environment do
    session.get routes.url_path(ENV['SHORTURL'].last(8))
    res = JSON.parse(session.response.body)

    if res["success"]
      puts "The original url of short url #{ENV['SHORTURL']} is #{res['original_url']}"
    else
      puts "No original url was found for the  short url #{ENV['SHORTURL']}"
    end
  end
end
