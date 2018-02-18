require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "has a valid factory" do
      FactoryBot.build(:user).should be_valid
    end

    it "should require a email" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      user.errors.should have_key(:email)
    end

    it "should require a valid password" do
      user = FactoryBot.build(:user, password: "")
      user.valid?
      user.errors.should have_key(:password)
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:trips) }
  end
end
