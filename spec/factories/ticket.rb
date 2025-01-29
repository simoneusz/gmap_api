FactoryBot.define do
  factory :ticket do
    request_number { 'id + 1' }
    sequence_number { '123' }
    request_type { 'normal' }
    response_due_date_time { Time.current }
    primary_service_area_code { 'ZL103' }
    additional_service_area_codes { 'ZL103' }
    well_known_text { 'POLYGON((-81.1339 32.07206,-81.14660 32.040643,-81.08858 32.022598' }
  end
end
