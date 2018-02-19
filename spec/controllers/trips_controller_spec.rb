require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  let (:trips) { create :trip_with_budget_items_and_activities }
  let(:user) { create :user_with_trips }

  describe "GET #index" do
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
      before do
        login_with user
        get :show, params: { id: user.trips.first.id }
      end

      it "" do
        expect(response).to have_http_status 200
        expect(@trip.name).to eq(user.trips.find_by(id: params[:id]));
        expect(@budget_items.length).to eq(5);
        expect(@activities.length).to eq(5);
      end

      # it "redirects the user to the trips_path" do
      #   expect(assigns(:budget_items).length).to eq(2)
      # end

      # it "redirects the user to the trips_path" do
      #   expect(assigns(:activities).length).to eq(2)
      # end

      # it "returns a 200 status" do
      #   expect(response).to have_http_status 200
      # end
    end
  end
end
