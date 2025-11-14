# frozen_string_literal: true

module CodeInvaders
  class PatternLoader
    attr_reader :radar_dir, :invaders_dir

    def initialize(radar_dir: nil, invaders_dir: nil)
      @radar_dir = radar_dir || default_radar_dir
      @invaders_dir = invaders_dir || default_invaders_dir
    end

    def load_radar
      radar_files = Dir.glob(File.join(@radar_dir, '*.txt')).sort

      if radar_files.empty?
        raise Errors::InvalidInputError, "Nije pronađen nijedan radar fajl u #{@radar_dir}"
      end

      radar_file = radar_files.first
      radar_name = format_invader_name(radar_file)
      puts "Učitavanje radara: #{radar_name}"
      radar_data = load_file(radar_file)

      RadarSample.new(radar_data, name: radar_name)
    end

    def load_invaders
      invader_files = Dir.glob(File.join(@invaders_dir, '*.txt')).sort

      if invader_files.empty?
        raise Errors::InvalidInputError, "Nije pronađen nijedan invader fajl u #{@invaders_dir}"
      end

      invaders = invader_files.map do |file|
        invader_name = format_invader_name(file)
        puts "Učitavanje invadera: #{invader_name}"
        InvaderPattern.new(invader_name, load_file(file))
      end

      puts "\nUčitavanje svih invadera završeno.\n"
      invaders
    end

    private

    def load_file(path)
      unless File.exist?(path)
        raise Errors::InvalidInputError, "Fajl nije pronađen: #{path}"
      end
      File.read(path)
    end

    def format_invader_name(file_path)
      File.basename(file_path, '.txt').split('_').map(&:capitalize).join(' ')
    end

    def default_radar_dir
      File.expand_path('../../data/radar', __dir__)
    end

    def default_invaders_dir
      File.expand_path('../../data/invaders', __dir__)
    end
  end
end