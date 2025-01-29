require 'rails_helper'

RSpec.describe Excavator, type: :model do
  subject { create(:excavator) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:ticket_id) }
    it { is_expected.to validate_presence_of(:company_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:crew_on_side) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:ticket) }
  end
end
