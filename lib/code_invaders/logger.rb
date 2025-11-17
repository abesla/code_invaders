# frozen_string_literal: true

module CodeInvaders
  class Logger
    def self.info(message)
      puts " #{message} "
    end

    def self.separator
      puts "=" * 50
    end
  end
end
