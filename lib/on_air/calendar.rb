require_relative '../../config'

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
      events.find do |event|
        next if event.start.date_time.nil?
        time_from_now(event) <= 2
      end.present?
    end

    def time_from_now(event)
      event_start = event.start.date_time
      minutes = (event_start - DateTime.now) * 24 * 60
      minutes.to_f
    end
  end
end
