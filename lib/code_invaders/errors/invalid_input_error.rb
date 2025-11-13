# frozen_string_literal: true

module CodeInvaders
  module Errors
    class InvalidInputError < StandardError;
      def initialize(message)
        super("\nGREŠKA!!!\n\n#{message}\n\n")
      end
    end
  end
end
