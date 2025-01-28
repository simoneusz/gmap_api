# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_250_128_092_453) do
  # These are extensions that must be enabled in order to support this database
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
