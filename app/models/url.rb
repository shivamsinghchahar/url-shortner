class Url < ApplicationRecord
  validates :original_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
            uniqueness: true
<<<<<<< HEAD
  validates :slug, presence: true, uniqueness: true

  def shorten_url
    loop do
      slug = SecureRandom.urlsafe_base64(6, false)
      break self.slug = slug unless Url.exists?(slug: slug)
=======
  validates :shortend_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
            uniqueness: true

  def shorten_url
    loop do
      token = SecureRandom.urlsafe_base64(6, false)
      shortend_url = "#{self.original_url.split('//').first}//short.is/#{token}"
      break self.shortend_url = shortend_url unless Url.exists?(shortend_url: shortend_url)
>>>>>>> b7d878f... Added Url model
    end
  end
end
