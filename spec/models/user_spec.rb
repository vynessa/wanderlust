require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "has a valid factory" do
      FactoryBot.create(:user).should be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:trips) }
  end
end
