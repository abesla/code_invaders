# frozen_string_literal: true

module CodeInvaders
  module Errors
    class InconsistentLineWidthError < StandardError
      attr_reader :min_width, :max_width, :line_widths

      def initialize(line_widths)
        @line_widths = line_widths
        @min_width = line_widths.min
        @max_width = line_widths.max
        super("UPOZORENJE!!!\n\nUlaz nema istu širinu čitanja za sve linije.\nŠirine linija variraju od #{@min_width} do #{@max_width}.\nKoristit će se najmanja širina od #{@min_width}.\n\n")
      end
    end
  end
end
