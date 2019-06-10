require 'securerandom'

class User < ApplicationRecord

  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password
  has_many :favorites

  def self.get_key
    SecureRandom.urlsafe_base64(18)
  end

end
