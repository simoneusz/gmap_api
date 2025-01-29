FactoryBot.define do
  factory :excavator do
    company_name { 'John Doe CONSTRUCTION' }
    address { '555 Some RD' }
    crew_on_side { true }
    ticket
  end
end
