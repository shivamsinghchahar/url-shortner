namespace :app do
  desc "Encode the given URL"
  task encode: :environment do
    url = Url.find_by(original_url: ENV['URL'])
    
    unless url
      url = Url.new(original_url: ENV['URL'])
      url.shorten_url
    end
    
    if url.save
      puts "The shortened url of #{ENV['URL']} is #{url.shortend_url}"
    end
  end

  desc "Decode the given URL"
  task decode: :environment do
    url = Url.find_by(shortend_url: ENV['SHORTURL'])
    if url
      puts "The original url of short url #{ENV['SHORTURL']} is #{url.original_url}"
    else
      puts "No original url was found for the  short url #{ENV['SHORTURL']}"
    end
  end
end
