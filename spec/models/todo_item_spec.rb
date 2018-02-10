require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:trip) }
  end
end
