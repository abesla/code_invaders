# frozen_string_literal: true

module CodeInvaders
  class OutputFormatter
    def self.print_results(results)
      if results.empty?
        puts "Nije detektovan nijedan invader."
        return
      end

      results.sort_by { |r| [-r.score, r.invader_name, r.y, r.x] }.each do |result|
        puts result.to_s
      end
    end
  end
end
