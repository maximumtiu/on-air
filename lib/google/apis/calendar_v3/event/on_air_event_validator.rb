# monkeypatching a validator for Google Calendar events
# based on my rules for whether or not an event should trigger the on-air light
module Google::Apis::CalendarV3::Event::OnAirEventValidator
  def valid?
    color_id.blank? &&
      accepted? &&
      start.date_time.present? &&
      starts_soon? &&
      real_event?
  end

  private

  # starts in 2 minutes or less
  def starts_soon?
    time_from_now <= 2
  end

  # amount of time until the event starts
  def time_from_now
    event_start = start.date_time
    minutes = (event_start - DateTime.now) * 24 * 60
    minutes.to_f
  end

  def accepted?
    attendees&.find { |a| a.email.include? 'megan@' }&.response_status != 'declined'
  end

  # these events are meant to be a blocker on the calendar for non-work things
  def real_event?
    !summary.include?('busy')
  end
end

monkeypatch_module = Google::Apis::CalendarV3::Event::OnAirEventValidator
Google::Apis::CalendarV3::Event.include monkeypatch_module
