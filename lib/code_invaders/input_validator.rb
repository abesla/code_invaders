# frozen_string_literal: true

module CodeInvaders
  class InputValidator
    attr_reader :grid, :width, :height

    def initialize(grid)
      @grid = grid
      @width = grid.empty? ? 0 : grid.first.size
      @height = grid.size
    end

    def validate
      raise Errors::InvalidInputError.new("Ulaz ne može biti prazan!") if @grid.empty?

      if @grid.any? { |line| line.empty? || line.all? { |char| char.nil? || char.strip.empty? } }
        warn Errors::EmptyLineError.new.message
        @grid = @grid.reject { |line| line.empty? || line.all? { |char| char.nil? || char.strip.empty? } }
      end

      raise Errors::InvalidInputError.new("Ulaz ne može biti prazan nakon uklanjanja praznih linija!") if @grid.empty?

      @width = @grid.first.size
      @height = @grid.size

      unless @grid.all? { |line| line.size == @width }
        line_widths = @grid.map(&:size)
        error = Errors::InconsistentLineWidthError.new(line_widths)
        warn error.message
        @width = error.min_width
        @grid = @grid.map { |line| line.take(@width) }
      end

      invalid_chars = @grid.flatten.select { |char| char != '-' && char != 'o' }
      unless invalid_chars.empty?
        error = Errors::InvalidCharactersError.new(invalid_chars)
        warn error.message
        @grid = @grid.map { |line| line.map { |char| error.invalid_chars.include?(char) ? ['-', 'o'].sample : char } }
      end

      @grid
    end
  end
end
