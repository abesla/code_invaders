# frozen_string_literal: true

module CodeInvaders
  class PatternMatcher
    attr_reader :threshold

    def initialize(radar, invader)
      @radar = radar
      @invader = invader
      @threshold = 0.7
    end

    def find_matches
      check_invader_fits_on_radar

      matches = []

      (0..@radar.height - @invader.height).each do |offset_y|
        (0..@radar.width - @invader.width).each do |offset_x|
          result = calculate_match(offset_x, offset_y)

          if result[:score] >= @threshold
            matches << {
              invader_name: @invader.name,
              x: offset_x,
              y: offset_y,
              score: result[:score]
            }
          end
        end
      end

      matches
    end

    private

    def check_invader_fits_on_radar
      if @invader.height > @radar.height || @invader.width > @radar.width
        warn "UPOZORENJE!!!\n\nInvader '#{@invader.name}' ima dimenzije [#{@invader.height}][#{@invader.width}] koje su veće od dimenzija radara [#{@radar.height}][#{@radar.width}].\nDetekcija može biti neuspješne ili netačna.\n\n"
      end
    end

    def calculate_match(offset_x, offset_y)
      total_possible_matches = 0
      actual_matches = 0

      @invader.height.times do |dy|
        @invader.width.times do |dx|
          invader_pixel = @invader.grid[dy][dx]

          next if invader_pixel == '-'

          radar_y = offset_y + dy
          radar_x = offset_x + dx

          if radar_y >= 0 && radar_y < @radar.height && radar_x >= 0 && radar_x < @radar.width
            total_possible_matches += 1
            radar_pixel = @radar.grid[radar_y][radar_x]
            actual_matches += 1 if invader_pixel == radar_pixel
          end
        end
      end

      score = total_possible_matches.zero? ? 0.0 : actual_matches.to_f / total_possible_matches

      { score: score, matches: actual_matches, total: total_possible_matches }
    end
  end
end
