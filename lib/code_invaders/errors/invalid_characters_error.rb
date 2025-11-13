# frozen_string_literal: true

module CodeInvaders
  module Errors
    class InvalidCharactersError < StandardError
      attr_reader :invalid_chars, :valid_chars

      def initialize(invalid_chars, valid_chars = ['-', 'o'])
        @invalid_chars = invalid_chars.uniq
        @valid_chars = valid_chars
        super("UPOZORENJE!!!\n\nUlaz sadži nepoznate karaktere: #{@invalid_chars.join(', ')}.\nDozvoljeni karakteri su: #{@valid_chars.join(', ')}.\nNepoznati karakteri će se tretirati kao šum i zamijeniti sa '-' ili 'o' na random.\n\n")
      end
    end
  end
end
