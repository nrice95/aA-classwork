class AddUserIdToShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    add_column(:shortened_urls,:user_id,:int)
  end
end
