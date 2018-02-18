require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Validations' do
    it "has a valid factory" do
      FactoryBot.build(:trip).should be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:activities) }
    it { is_expected.to have_many(:budget_items) }
  end
end
