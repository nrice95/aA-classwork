# == Schema Information
#
# Table name: shortened_urls
#
#  id        :integer          not null, primary key
#  short_url :string           not null
#  long_url  :string           not null
#  user_id   :integer
#

require "securerandom"

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true

  belongs_to :submitter,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  has_many :visits,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

  def self.random_code
    short_url_code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url_code)
      short_url_code = SecureRandom.urlsafe_base64
    end
    short_url_code
  end

  def self.create_short_url(user,long_url_str)
    short_url_str = ShortenedUrl.random_code

    ShortenedUrl.create!(
      short_url: short_url_str,
      long_url: long_url_str,
      user_id: user.id
    )
    short_url_str
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where(
      'visits.created_at >= :ten_minutes_ago',
      :ten_minutes_ago => Time.now - 10.minutes
    ).count
  end


end
