class Url < ApplicationRecord
  validates :original_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
            uniqueness: true
  validates :shortened_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
            uniqueness: true

  def shorten_url
    loop do
      token = SecureRandom.urlsafe_base64(6, false)
      shortened_url = "#{self.original_url.split('//').first}//short.is/#{token}"
      break self.shortened_url = shortened_url unless Url.exists?(shortened_url: shortened_url)
    end
  end
end
