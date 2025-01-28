# frozen_string_literal: true

# Service for creating ticket and excavator objects from http request
class TicketCreationService
  attr_reader :data, :ticket, :excavator, :errors

  def initialize(data)
    @data = data
    @errors = []
  end

  def call
    ActiveRecord::Base.transaction do
      @ticket = Ticket.create!(parse_data(ParsedFields::TICKET))
      @excavator = @ticket.excavators.create!(parse_data(ParsedFields::EXCAVATOR))
    rescue ActiveRecord::RecordInvalid => e
      @errors << e.record.errors.full_messages
      raise ActiveRecord::Rollback
    end
    self
  end

  def success?
    @errors.empty?
  end

  def parse_data(parse_fields)
    parse_fields.transform_values { |value| @data.dig(*value) }
  end
end
