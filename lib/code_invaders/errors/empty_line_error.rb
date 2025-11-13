# frozen_string_literal: true

module CodeInvaders
  module Errors
    class EmptyLineError < StandardError
      def initialize
        super("UPOZORENJE!!!\n\nUlaz sadrži prazne linije.\nPrazne linije će biti zanemarene i uklonjene iz unosa.\n\n")
      end
    end
  end
end
