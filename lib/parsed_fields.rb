# frozen_string_literal: true

# Class that stores params for parsing json string
# format value_name: PathToValue(array)
class ParsedFields
  TICKET = {
    request_number: ['RequestNumber'],
    sequence_number: ['SequenceNumber'],
    request_type: ['RequestType'],
    response_due_date_time: %w[DateTimes ResponseDueDateTime],
    primary_service_area_code: %w[ServiceArea PrimaryServiceAreaCode SACode],
    additional_service_area_codes: %w[ServiceArea AdditionalServiceAreaCodes SACode],
    well_known_text: %w[ExcavationInfo DigsiteInfo WellKnownText]
  }.freeze

  EXCAVATOR = {
    company_name: %w[Excavator CompanyName],
    address: %w[Excavator Address],
    crew_on_side: %w[Excavator CrewOnSite]
  }.freeze
end
