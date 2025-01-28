# frozen_string_literal: true

# Ticket model
class Ticket < ApplicationRecord
  has_many :excavators, dependent: :destroy

  validates :request_number,
            :sequence_number,
            :request_type,
            :response_due_date_time,
            :primary_service_area_code,
            :additional_service_area_codes,
            :well_known_text,
            presence: true
end
