class Url < ApplicationRecord
  validates :original, presence: true, format: { with: URI::regexp(%w(http https)), message: "Valid URL required"},
            uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :pinned, presence: true, allow_nil: true, inclusion: { in: [0, 1], message: 'Invalid' } 

  def shorten_url
    loop do
      slug = SecureRandom.urlsafe_base64(6, false)
      break self.slug = slug unless Url.exists?(slug: slug)
    end
  end
end
