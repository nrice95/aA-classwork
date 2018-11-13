# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, passed_word)
    user = User.find_by(username: username)
    return nil unless user && user.is_password?(passed_word)
    user
  end

  def password=(passed_word)
    @password = passed_word
    self.password_digest = BCrypt::Password.create(passed_word)
  end

  def is_password?(passed_word)
    BCrypt::Password.new(self.password_digest).is_password?(passed_word)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
