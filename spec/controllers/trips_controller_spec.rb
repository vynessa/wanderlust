require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  include Devise::Test::ControllerHelpers
  let (:trips) { create :trip_with_budget_items_and_activities }
  let(:user) { create :user_with_trips }

  describe "GET #index" do
    context "when user is not logged in" do
      before :each do
        login_with nil
        get :index
      end

      it "redirects the user to sign_in path" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET #index" do
    context "when user is logged in" do
      before do
        login_with user
        get :index
      end

      it "redirects the user to the trips_path" do
        expect(assigns(:trips).length).to eq(5)
      end

      it "returns a 200 status" do
        expect(response).to have_http_status 200
      end
    end
  end

  describe "GET #show" do
    context "when user is logged in" do
      let(:id) { user.trips.first.id }
      before do
        login_with user
        get :show, params: { id: id}
      end

      it "fetches the trip name and activities" do
        expect(response).to have_http_status 200
      end

      it "fetches a trip" do
        expect(assigns(:trip).name).to eq(user.trips.find_by(id: id).name);
      end

      it "fetches an array of budget items" do
        expect(assigns(:budget_items).length).to eq(5)
      end

      it "fetches a list of activities" do
        expect(assigns(:activities).length).to eq(5)
      end
    end
  end
end