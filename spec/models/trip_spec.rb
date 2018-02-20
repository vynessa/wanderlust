require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:activities) }
    it { is_expected.to have_many(:budget_items) }
  end
end
