require 'rails_helper'
module Api
  RSpec.describe TicketsController, type: :controller do
    let(:ticket) { create(:ticket) }
    describe 'GET #index' do
      it 'assigns all tickets to @tickets' do
        subject { ticket }
        get :index
        expect(assigns(:tickets)).to eq([ticket])
      end
    end

    describe 'GET #show' do
      let(:ticket) { create(:ticket) }

      it 'assigns the requested ticket to @ticket' do
        get :show, params: { id: ticket.id }
        expect(assigns(:ticket)).to eq(ticket)
      end
    end

    describe 'POST #create' do
      context 'when the request is valid' do
        subject(:valid_ticket_data) { JSON.parse(File.read(Rails.root.join('spec', 'fixtures', 'valid_ticket.json'))) }

        before do
          allow_any_instance_of(TicketCreationService)
            .to receive(:call)
            .and_return(double(success?: true, ticket: build(:ticket), excavator: build(:excavator)))
        end

        it 'returns a success response' do
          post :create, body: valid_ticket_data.to_json, as: :json
          expect(response).to have_http_status(:ok)
          expect(JSON.parse(response.body)['message']).to eq('ok')
        end
      end

      context 'when the request is invalid' do
        before do
          allow_any_instance_of(TicketCreationService)
            .to receive(:call)
            .and_return(double(
                          success?: false,
                          errors: ['Invalid data']
                        ))
        end

        it 'returns an unprocessable entity response' do
          post :create, body: {}.to_json, as: :json
          expect(response).to have_http_status(:unprocessable_entity)
          expect(JSON.parse(response.body)['message']).to eq('error')
        end
      end
    end
  end
end
