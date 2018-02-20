require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
  include Devise::Test::ControllerHelpers
  let (:trip) { create :trip_with_budget_items_and_activities }
  let(:user) { create :user_with_trips }


  describe "GET #create" do
    context "when user is logged in" do
      let(:id) { user.trips.first.id }
      let(:activity) { build(:activity, trip: trip) }

      before do
        login_with user
        post :create,  params: { trip_id: trip.id, activity: activity.attributes }
      end

      it "returns a newly created activity" do
        expect(assigns(:activity).id).to eq(Activity.last.id);
      end

    end
  end

  describe "GET #update" do
    context "when user is logged in" do
      let(:id) { user.trips.first.id }
      let(:activity) { trip.activities.first }

      before do
        login_with user
        patch :update,  params: { trip_id: trip.id, id: activity.id, activity: { status: false } }
      end

      it "updates an activity" do
        expect(activity.status).to eq(true)
        expect(assigns(:activity).status).to eq(false);
      end

    end
  end

  describe "GET #destroy" do
    context "when user is logged in" do
      let(:id) { user.trips.first.id }
      let(:activity) { trip.activities.first }

      before do
        login_with user
        delete :destroy,  params: { trip_id: trip.id, id: activity.id }
      end

      it "delete an activity" do
        expect(Activity.find_by_id(activity.id)).to be_nil
      end

    end
  end
end
