Gem::Specification.new do |s|
  s.name          = 'code_invaders'
  s.version       = begin
                      ver_file = File.expand_path('lib/code_invaders/version.rb', __dir__)
                      File.read(ver_file).match(/VERSION\s*=\s*['"]([^'"]+)['"]/)[1]
                    rescue
                      '0.0.0'
                    end
  s.summary       = 'Detect invader patterns in radar ASCII samples'
  s.description   = 'Analysis of radar input for detecting invaders using ASCII patterns. OOP and SOLID principles with tests and gem structure.'
  s.authors       = ['Adin Beslagić']
  s.email         = ['abeslagic@capeannenterprises.com']
  s.homepage      = 'https://github.com/abesla/code_invaders'
  s.required_ruby_version = '>= 2.7.0'

  s.files         = Dir.glob('{lib,data}/**/*')
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.0'

  s.metadata = {
    'source_code_uri' => s.homepage
  }
end