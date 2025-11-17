#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'code_invaders/grid_pattern'
require_relative 'code_invaders/pattern_matcher'
require_relative 'code_invaders/match_result'
require_relative 'code_invaders/logger'
require_relative 'code_invaders/result_formatter'
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
    invaders.each do |invader|
      matcher = PatternMatcher.new(radar, invader)
      results.concat(matcher.find_matches)
    end

    results
  end

  def self.start(logger: Logger)
    start_time = Time.now
    logger.separator
    logger.info("Pokrećem učitavanje podataka...")
    logger.separator
    loader = PatternLoader.new

    logger.info("Učitavanje radara...")
    radar = loader.load_radar
    logger.info("Validacija radara završena.")
    logger.separator

    logger.info("Učitavanje invadera...")
    invaders = loader.load_invaders
    logger.info("Učitavanje svih invadera završeno.")
    logger.separator

    logger.info("Pokrećem detekciju invadera...")
    results = scan(radar, invaders)
    logger.info("Detekcija invadera završena.")
    logger.separator

    puts ResultFormatter.format(results)
    logger.separator
    logger.info("=== Ukupno trajanje: #{Time.now - start_time} s ===")
    logger.separator
  end

  if __FILE__ == $PROGRAM_NAME
    start
  end
end