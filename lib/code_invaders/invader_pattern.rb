# frozen_string_literal: true

module CodeInvaders
  class InvaderPattern
    attr_reader :name, :grid, :width, :height

    def initialize(name, raw_pattern)
      raise Errors::InvalidInputError.new("Ime invadera je obavezno") if name.nil? || name.strip.empty?
      raise Errors::InvalidInputError.new("Pattern invadera je obavezan") if raw_pattern.nil? || raw_pattern.strip.empty?

      @name = name
      @grid = parse(raw_pattern)
      @height = @grid.size
      @width = @grid.empty? ? 0 : @grid.first.size
    end

    private

    def parse(raw_pattern)
      lines = raw_pattern.strip.split("\n")
      lines.map(&:chars)
    end
  end
end
