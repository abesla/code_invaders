# frozen_string_literal: true

module CodeInvaders
  class RadarSample
    attr_reader :grid, :width, :height

    def initialize(raw_data, name: "Radar")
      raise Errors::InvalidInputError.new("Radar nije pročitao ništa!") if raw_data.nil? || raw_data.strip.empty?

      @name = name
      puts "Validacija #{@name}..."
      @grid = parse(raw_data)
      @height = @grid.size
      @width = @grid.empty? ? 0 : @grid.first.size
      puts "Validacija #{@name} završena.\n\n=================================================="
    end

    private

    def parse(raw_data)
      lines = raw_data.strip.split("\n")
      grid = lines.map(&:chars)
      validator = InputValidator.new(grid)
      validator.validate
    end
  end
end
