require_relative '../../config'
require_relative '../google/apis/calendar_v3/event/on_air_event_validator'

module OnAir
  class Calendar
    attr_accessor :client, :current_event
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

    def current_event
      @current_event ||= events.find(&:valid?)
    end

    def event_now?
      current_event.present?
    end

    def end_time
      current_event&.end.date_time&.to_i
    end
  end
end
