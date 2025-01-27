# frozen_string_literal: true

module Api
  class TicketsController < ApplicationController
    def create
      data = JSON.parse(request.body.read)
      render json: { message: 'ok', received_data: data }, status: :ok
    end
  end
end
