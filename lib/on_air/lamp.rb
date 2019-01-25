require_relative '../../config'

module OnAir
  class Lamp
    attr_accessor :client
    def initialize
      @client = hue_client
    end

    def light
      @light ||= client.lights.find {|bulb| bulb.name.include?('Living Room')}
    end

    def on
      return if light.nil? || light.on?
      light.on!
      light.color_temperature = 500
      light.hue = 920 #red
    end

    def off
      return unless light&.on?
      light.off!
    end
  end
end
