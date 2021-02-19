require 'securerandom'

class ShortenedUrls < ApplicationRecord

  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :user_id, presence: true

  def self.random_code
    
    code = SecureRandom.base64
    until !ShortenedUrls.exists?(code)
      code = SecureRandom.base64
    end
    return code
    
  end

  def self.create_short_url(user, long_url)
    ShortenedUrls.create!(useruser, long_url, random_code)
  end

end