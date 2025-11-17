# frozen_string_literal: true

module CodeInvaders
  class ResultFormatter
    def self.format(results)
      return "Nije detektovan nijedan invader." if results.empty?

      sorted = results.sort_by { |r| [-r.score, r.invader_name, r.y, r.x] }

      output = []
      output << "=============== Rezultat detekcije ==============="
      output << "=" * 50
      output << "Detektovan broj invadera: #{sorted.length}\n"
      sorted.each { |result| output << result.to_s }
      output.join("\n")
    end
  end
end
