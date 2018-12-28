require_relative 'on_air/calendar'
require_relative 'on_air/lamp'

module OnAir
  def calendar
    @calendar ||= Calendar.new
  end

  def lamp
    @lamp ||= Lamp.new
  end

  def run
    calendar.event_now? ? lamp.on : lamp.off
  end
end
