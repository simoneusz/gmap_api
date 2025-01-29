ActiveRecord::Schema[7.1].define(version: 20_250_128_092_453) do
  enable_extension 'plpgsql'

  create_table 'excavators', force: :cascade do |t|
    t.bigint 'ticket_id', null: false
    t.string 'company_name', null: false
    t.text 'address'
    t.boolean 'crew_on_side', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ticket_id'], name: 'index_excavators_on_ticket_id'
  end

  create_table 'tickets', force: :cascade do |t|
    t.string 'request_number'
    t.string 'sequence_number'
    t.string 'request_type'
    t.datetime 'response_due_date_time'
    t.string 'primary_service_area_code'
    t.jsonb 'additional_service_area_codes'
    t.text 'well_known_text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['request_number'], name: 'index_tickets_on_request_number', unique: true
  end

  add_foreign_key 'excavators', 'tickets'
end
