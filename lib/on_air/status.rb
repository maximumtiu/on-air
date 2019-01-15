require_relative '../../config'

module OnAir
  class Status
    attr_accessor :client
    def initialize
      @client = slack_client
    end

    def set(expiration)
      client.users_profile_set(
        user: ENV['SLACK_API_USER'],
        profile: status.merge(status_expiration: expiration).to_json
      )
    end

    def status
      {
        status_text: 'In a meeting',
        status_emoji: ':spiral_calendar_pad:',
      }
    end
  end
end
