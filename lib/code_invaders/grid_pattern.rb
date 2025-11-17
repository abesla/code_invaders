# frozen_string_literal: true

module CodeInvaders
  class GridPattern
    attr_reader :grid, :width, :height, :name

    def initialize(raw_data, name:)
      validate_input(raw_data, name)
      @name = name
      @grid = parse(raw_data)
      @height = @grid.size
      @width = @grid.empty? ? 0 : @grid.first.size
    end

    private

    def validate_input(raw_data, name)
      raise Errors::InvalidInputError.new("#{name} nije pročitao ništa!") if raw_data.nil? || raw_data.strip.empty?
    end

    def parse(raw_data)
      lines = raw_data.strip.split("\n")
      grid = lines.map(&:chars)
      validator = InputValidator.new(grid)
      validator.validate
    end
  end
end
