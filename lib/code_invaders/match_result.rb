# frozen_string_literal: true

module CodeInvaders
  class MatchResult
    attr_reader :invader_name, :x, :y, :score, :off_screen

    def initialize(invader_name, x, y, score, off_screen: false)
      @invader_name = invader_name
      @x = x
      @y = y
      @score = score
      @off_screen = off_screen
    end

    def to_s
      location_info = off_screen ? " (djelimično off-screen)" : ""
      "#{invader_name} detektovan sa početnim koordinatama (#{y}, #{x}) sa preciznošću od #{(score * 100).round(2)}%#{location_info}"
    end
  end
end
