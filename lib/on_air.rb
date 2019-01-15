require_relative 'on_air/calendar'
require_relative 'on_air/lamp'
require_relative 'on_air/status'

module OnAir
  def calendar
    @calendar ||= Calendar.new
  end

  def lamp
    @lamp ||= Lamp.new
  end

  def status
    @status ||= Status.new
  end

  def run
    if calendar.event_now?
      status.set(calendar.end_time)
      lamp.on
    else
      lamp.off
    end
  end
end
