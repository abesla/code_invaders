#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'code_invaders/radar_sample'
require_relative 'code_invaders/invader_pattern'
require_relative 'code_invaders/pattern_matcher'
require_relative 'code_invaders/match_result'
require_relative 'code_invaders/output_formatter'
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

  def self.start
    start_time = Time.now


    radar_data = load_file(File.join(__dir__, '../data/radar/radar_sample.txt'))
    puts "Učitavanje radara završeno."

    invaders = []
    Dir.glob(File.join(__dir__, '../data/invaders/*.txt')).each do |file|
      puts "Učitavanje invadera iz #{file}..."
      invader_name = File.basename(file, '.txt').split('_').map(&:capitalize).join(' ')
      invaders << InvaderPattern.new(invader_name, load_file(file))
      puts "Učitavanje invadera #{invader_name} završeno."
    end
    puts "Učitavanje svih invadera završeno."

    results = scan(radar_data, invaders)
    puts "Detekcija invadera završena."

    OutputFormatter.print_results(results)
    puts "Ispis rezultata završen."
    puts "Ukupno trajanje: #{Time.now - start_time} s"
  end

  if __FILE__ == $PROGRAM_NAME
    start
  end
end