require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject { create(:ticket) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:request_number) }
    it { is_expected.to validate_presence_of(:sequence_number) }
    it { is_expected.to validate_presence_of(:request_type) }
    it { is_expected.to validate_presence_of(:response_due_date_time) }
    it { is_expected.to validate_presence_of(:primary_service_area_code) }
    it { is_expected.to validate_presence_of(:additional_service_area_codes) }
    it { is_expected.to validate_presence_of(:well_known_text) }
  end

  # describe 'associations' do
  #   it { is_expected.to belong_to(:user) }
  #   it { is_expected.to have_many(:images).order(likes_count: :desc).dependent(:destroy) }
  #   it { is_expected.to have_many(:comments).dependent(:destroy) }
  #   it { is_expected.to have_many(:subscriptions).dependent(:destroy) }
  #   it { is_expected.to have_many(:subscribers).through(:subscriptions).source(:user) }
  # end
end
