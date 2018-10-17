# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :password_digest, presence: true

  after_initialize :ensure_session_token
  attr_reader :password

  # Owner
  has_many :cats,
    foreign_key: :user_id,
    class_name: :Cat

  # Renter
  has_many :rental_requests,
    foreign_key: :renter_id,
    class_name: :CatRentalRequest

  def self.find_by_credentials(username, password)
    user = self.find_by(username: username)

    if user && user.is_password?(password)
      return user
    else
      nil
    end
  end


  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def password=(ps)
    @password = ps
    self.password_digest = BCrypt::Password.create(@password)
  end

  def is_password?(ps)
    BCrypt::Password.new(password_digest).is_password?(ps)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


end
