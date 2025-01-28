# frozen_string_literal: true

# Excavator model
class Excavator < ApplicationRecord
  belongs_to :ticket

  validates :ticket_id,
            :company_name,
            :address,
            :crew_on_side,
            presence: true
end
