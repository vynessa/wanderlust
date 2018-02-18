require 'rails_helper'

RSpec.describe BudgetItem, type: :model do
  describe 'Validations' do
    it "has a valid factory" do
      FactoryBot.build(:budget_item).should be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:trip) }
  end
end
