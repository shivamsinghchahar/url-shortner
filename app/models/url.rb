class Url < ApplicationRecord
  validates :original_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
            uniqueness: true
  validates :shortend_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
            uniqueness: true

  def shorten_url
    loop do
      token = SecureRandom.urlsafe_base64(6, false)
      shortend_url = "#{self.original_url.split('//').first}//short.is/#{token}"
      break self.shortend_url = shortend_url unless Url.exists?(shortend_url: shortend_url)
    end
  end
end
