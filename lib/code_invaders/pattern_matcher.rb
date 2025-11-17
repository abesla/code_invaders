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

      ((-@invader.height + @invader.height * @threshold).to_i..(@radar.height - @invader.height * @threshold).to_i).each do |offset_y|
        ((-@invader.width + @invader.width * @threshold).to_i..(@radar.width - @invader.width * @threshold).to_i).each do |offset_x|
          result = calculate_match(offset_x, offset_y)

          if result[:score] >= @threshold
            matches << MatchResult.new(@invader.name, offset_x, offset_y, result[:score], off_screen: result[:off_screen])
          end
        end
      end

      filter_overlapping_matches(matches)
    end
    def filter_overlapping_matches(matches)
      return matches if matches.empty?

      sorted_matches = matches.sort_by { |m| -m.score }
      filtered = []
      sorted_matches.each do |candidate|
        next if filtered.any? { |accepted| overlaps?(candidate, accepted) }

        filtered << candidate
      end
      filtered
    end

    def overlaps?(match1, match2)

      x_overlap = (match1.x < match2.x + @invader.width) &&
                  (match1.x + @invader.width > match2.x)

      y_overlap = (match1.y < match2.y + @invader.height) &&
                  (match1.y + @invader.height > match2.y)

      x_overlap && y_overlap
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
      is_offscreen = false

      @invader.height.times do |dy|
        @invader.width.times do |dx|
          invader_pixel = @invader.grid[dy][dx]

          next if invader_pixel == '-'

          radar_y = offset_y + dy
          radar_x = offset_x + dx

          total_possible_matches += 1

          if radar_y >= 0 && radar_y < @radar.height && radar_x >= 0 && radar_x < @radar.width
            radar_pixel = @radar.grid[radar_y][radar_x]
            actual_matches += 1 if invader_pixel == radar_pixel
          else
            is_offscreen = true
          end
        end
      end

      score = total_possible_matches.zero? ? 0.0 : actual_matches.to_f / total_possible_matches

      { score: score, matches: actual_matches, total: total_possible_matches, off_screen: is_offscreen }
    end
  end
end
