# frozen_string_literal: true

module Api
  # Api controller for receiving json data and converting it to *Ticket* and *Excavator*
  class TicketsController < ApplicationController
    protect_from_forgery with: :null_session, only: %i[create]

    def index
      @tickets = Ticket.all
    end

    def show
      @ticket = Ticket.find(params[:id])
    end

    def create
      service = TicketCreationService.new(JSON.parse(request.body.read)).call

      if service.success?
        render json: { message: 'ok', ticket: service.ticket, excavator: service.excavator }, status: :ok
      else
        render json: { message: 'error', errors: service.errors.flatten }, status: :unprocessable_entity
      end
    end

    private

    def parse_data(parse_fields)
      parse_fields.transform_values { |value| @data.dig(*value) }
    end
  end
end
