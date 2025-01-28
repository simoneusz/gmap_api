class Ticket < ApplicationRecord
  has_many :excavators, dependent: :destroy

  validates :request_number, :sequence_number, :request_type, presence: true
end
