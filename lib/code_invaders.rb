#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'code_invaders/radar_sample'
require_relative 'code_invaders/invader_pattern'
require_relative 'code_invaders/pattern_matcher'
require_relative 'code_invaders/match_result'
require_relative 'code_invaders/output_formatter'
require_relative 'code_invaders/input_validator'
require_relative 'code_invaders/pattern_loader'
require_relative 'code_invaders/errors/invalid_input_error'
require_relative 'code_invaders/errors/inconsistent_line_width_error'
require_relative 'code_invaders/errors/invalid_characters_error'
require_relative 'code_invaders/errors/empty_line_error'

module CodeInvaders
  def self.scan(radar, invaders)
    results = []
    puts "\nPokrećem detekciju invadera...\n"
    invaders.each do |invader|
      matcher = PatternMatcher.new(radar, invader)
      results.concat(matcher.find_matches)

      puts "Detekcija invadera završena.\n\n=================================================="
    end

    results
  end

  def self.start
    start_time = Time.now

    loader = PatternLoader.new

    radar = loader.load_radar
    invaders = loader.load_invaders

    results = scan(radar, invaders)


    results.sort_by! { |r| [-r.score, r.invader_name, r.y, r.x] }

    OutputFormatter.print_results(results)
    puts "=================================================="
    puts "=== Ukupno trajanje: #{Time.now - start_time} s ==="
    puts "=================================================="
  end

  if __FILE__ == $PROGRAM_NAME
    start
  end
end