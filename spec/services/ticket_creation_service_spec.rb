# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketCreationService do
  let(:valid_data) { JSON.parse(File.read(Rails.root.join('spec', 'fixtures', 'valid_data.json'))) }

  let(:invalid_data) { {} }

  describe '#call' do
    context 'when data is valid' do
      it 'creates a ticket and an associated excavator' do
        service = described_class.new(valid_data).call

        expect(service.success?).to be true
        expect(service.ticket).to be_persisted
        expect(service.excavator).to be_persisted
        expect(service.errors).to be_empty
      end
    end

    context 'when data is invalid' do
      it 'does not create a ticket or an excavator and collects errors' do
        service = described_class.new(invalid_data).call

        expect(service.success?).to be false
        expect(service.ticket).to be_nil
        expect(service.excavator).to be_nil
        expect(service.errors).not_to be_empty
      end
    end
  end
end
