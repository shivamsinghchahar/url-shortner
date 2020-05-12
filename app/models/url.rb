class Url < ApplicationRecord
  validates :original_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
            uniqueness: true
<<<<<<< HEAD
<<<<<<< HEAD
  validates :slug, presence: true, uniqueness: true

  def shorten_url
    loop do
      slug = SecureRandom.urlsafe_base64(6, false)
      break self.slug = slug unless Url.exists?(slug: slug)
=======
  validates :shortend_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
=======
  validates :shortened_url, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
>>>>>>> b970902... Fixed typo
            uniqueness: true

  def shorten_url
    loop do
      token = SecureRandom.urlsafe_base64(6, false)
<<<<<<< HEAD
      shortend_url = "#{self.original_url.split('//').first}//short.is/#{token}"
      break self.shortend_url = shortend_url unless Url.exists?(shortend_url: shortend_url)
>>>>>>> b7d878f... Added Url model
=======
      shortened_url = "#{self.original_url.split('//').first}//short.is/#{token}"
      break self.shortened_url = shortened_url unless Url.exists?(shortened_url: shortened_url)
>>>>>>> b970902... Fixed typo
    end
  end
end
