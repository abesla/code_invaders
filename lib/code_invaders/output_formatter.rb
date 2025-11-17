# frozen_string_literal: true

module CodeInvaders
  class OutputFormatter
    def self.print_results(results)
      if results.empty?
        puts "Nije detektovan nijedan invader."
        return
      end

      puts "=============== Rezultat detekcije ===============\n=================================================="
      puts "Detektovan broj invadera: #{results.length}\n"
      results.each do |result|
        puts result.to_s
      end
    end
  end
end
