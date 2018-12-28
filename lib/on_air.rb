require_relative 'on_air/calendar'
require_relative 'on_air/lamp'

module OnAir
  def self.calendar
    @calendar ||= Calendar.new
  end

  def self.lamp
    @lamp ||= Lamp.new
  end

  def self.run
    calendar.event_now? ? lamp.on : lamp.off
  end
end

OnAir.run
