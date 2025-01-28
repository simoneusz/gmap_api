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
      @data = JSON.parse(request.body.read)
      logger.info("JSON PARSE: #{parse_data(ParsedFields::TICKET)}")
      @ticket = Ticket.new(parse_data(ParsedFields::TICKET))
      render json: { errors: @ticket.errors.full_messages }, status: :unprocessable_entity unless @ticket.save
      @excavator = @ticket.excavators.create(parse_data(ParsedFields::EXCAVATOR))
      if @excavator.valid?
        render json: { message: 'ok', received_data: [@ticket, @excavator] }, status: :ok
      else
        render json: { errors: [@ticket.errors.full_messages, @excavator.errors.full_messages] },
               status: :unprocessable_entity
      end
    end

    private

    def parse_data(parse_fields)
      parse_fields.transform_values { |value| @data.dig(*value) }
    end
  end
end
