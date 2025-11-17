# frozen_string_literal: true

module CodeInvaders
  class OutputFormatter
    def self.print_results(results)
      puts ResultFormatter.format(results)
    end
  end
end
