require 'rails_helper'

RSpec.describe BudgetItemsController, type: :controller do
  include Devise::Test::ControllerHelpers
  let (:trip) { create :trip_with_budget_items_and_activities }
  let(:user) { create :user_with_trips }


  describe "GET #create" do
    context "when user is logged in" do
      let(:id) { user.trips.first.id }
      let(:budget_item) { build(:budget_item, trip: trip) }

      before do
        login_with user
        post :create,  params: { trip_id: trip.id, budget_item: budget_item.attributes }
      end

      it "returns a newly created budget item" do
        expect(assigns(:budget_item).id).to eq(BudgetItem.last.id);
      end

    end
  end

  describe "GET #update" do
    context "when user is logged in" do
      let(:id) { user.trips.first.id }
      let(:budget_item) { trip.budget_items.first }

      before do
        login_with user
        patch :update,  params: { trip_id: trip.id, id: budget_item.id, budget_item: { item: 'New Item' } }
      end

      it "updates an budget_item" do
        expect(assigns(:budget_item).item).to eq('New Item');
      end

    end
  end

  describe "GET #destroy" do
    context "when user is logged in" do
      let(:id) { user.trips.first.id }
      let(:budget_item) { trip.budget_items.first }

      before do
        login_with user
        delete :destroy,  params: { trip_id: trip.id, id: budget_item.id }
      end

      it "delete an budget_item" do
        expect(BudgetItem.find_by_id(budget_item.id)).to be_nil
      end

    end
  end
end