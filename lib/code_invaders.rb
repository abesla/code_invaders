#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'code_invaders/radar_sample'
require_relative 'code_invaders/invader_pattern'
require_relative 'code_invaders/pattern_matcher'
require_relative 'code_invaders/input_validator'
require_relative 'code_invaders/errors/invalid_input_error'
require_relative 'code_invaders/errors/inconsistent_line_width_error'
require_relative 'code_invaders/errors/invalid_characters_error'
require_relative 'code_invaders/errors/empty_line_error'

module CodeInvaders
  def self.scan(radar_data, invaders)
    radar = RadarSample.new(radar_data)
    results = []

    invaders.each do |invader|
      matcher = PatternMatcher.new(radar, invader)
      results.concat(matcher.find_matches)
    end

    results
  end

  def self.load_file(path)
    unless File.exist?(path)
      puts "Fajl nije pronađen: #{path}"
      exit(1)
    end
    File.read(path)
  end

  if __FILE__ == $PROGRAM_NAME

    invader_a = InvaderPattern.new('Invader A', load_file(File.join(__dir__, '../data/invader_a.txt')))
    invader_b = InvaderPattern.new('Invader B', load_file(File.join(__dir__, '../data/invader_b.txt')))

    radar_data = load_file(File.join(__dir__, '../data/radar_sample.txt'))

    results = scan(radar_data, [invader_a, invader_b])

    results.each do |result|
      puts "Detektovan invader '#{result.invader_name}' na koordinatama [#{result.x}, #{result.y}] sa score-om #{result.score}"
    end
  end
end
