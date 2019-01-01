require_relative '../../config'
require_relative '../google/apis/calendar_v3/event/on_air_event_validator'

module OnAir
  class Calendar
    attr_accessor :client
    def initialize
      @client = cal_client
    end

    def events
      calendar_id = 'primary'
      response = client.list_events(calendar_id,
                                    max_results: 10,
                                    single_events: true,
                                    order_by: 'startTime',
                                    time_min: Time.now.iso8601)
      response&.items
    end

    def event_now?
      events.find(&:valid?).present?
    end
  end
end
