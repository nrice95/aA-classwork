require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      it "redirects user to their homepage" do
        post :create, params: {user: {username: 'Abc', password: 'hunter2'}}
        # expect(response).to redirect_to(users_url(User.find_by(username: 'Abc')))
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid params" do
      it " validates presence of the user's username and password" do
        post :create, params: {user: {username:'yes'}}
        expect(response).to render_template("new")
        expect(flash[:errors]).to_not be(nil)
      end

      it "validates password minimum length of 2" do
        post :create, params: {user: {username:'yes',password:'1'}}
        expect(response).to render_template("new")
        expect(flash[:errors]).to_not be(nil)
      end
    end

  end
end
