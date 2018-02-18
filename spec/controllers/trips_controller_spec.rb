require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  describe "GET #index" do
    context "when user is logged in" do
      it "redirects the user to the trips_path" do
        login_with create(:user)
        get :index
        expect(response).to redirect_to(trips_path)
      end

      it "returns a 200 status" do
        expect(response).to have_http_status 200
      end
    end

    context "when user is not logged in" do
      before :each do
        login_with nil
      end
  
      it "redirects the user to sign_in path" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end

      it "returns a 200 status" do
        expect(response).to have_http_status 200
      end
    end
  end

  describe "GET #show" do
    # pending
  end
end