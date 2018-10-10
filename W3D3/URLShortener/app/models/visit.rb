# == Schema Information
#
# Table name: visits
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  shortened_url_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Visit < ApplicationRecord

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  belongs_to :user_url,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: :ShortenedUrl


  def self.record_visit!(user, shortened_url)
    self.create!(user_id: user.id, shortened_url_id: shortened_url.id)
  end


end
