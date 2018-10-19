require 'rails_helper'

describe User do
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it {should validate_length_of(:password).is_at_least(2)}

  context "when creating a new user" do
    subject(:user) {User.new}
    it "ensures session token exists" do
      expect(user.session_token).to_not be(nil)
    end
  end


  describe "User::find_by_credentials" do
    subject(:user) { create(:user)}
    before {user.save!}
    it "returns user given good credentials" do
      expect(User.find_by_credentials(user.username,"starwars")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials(user.username,"starward")).to eq(nil)
    end
  end

  describe "User#reset_session_token!" do
    subject(:user) {create(:user)}
    before {user.save!}
    it "resets the session token" do
      st1 = user.session_token
      st2 = user.reset_session_token!

      expect(st1).to_not eq(st2)
      expect(st1).to_not eq(user.session_token)
    end
  end

  describe "User#is_password?" do
    subject(:user) {create(:user)}
    before {user.save!}
    it "checks that given password matches user's password" do
      expect(user.is_password?("starwars")).to eq(true)
      expect(user.is_password?("startreks")).to eq(false)
    end
  end
end
