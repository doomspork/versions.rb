Gem::Specification.new do |s|
  s.name        = 'versions.rb'
  s.version     = '1.0' 
  s.summary     = 'Support for versioned class definitions.'
  s.description = 'Using simple namespacing Versions.rb lets you load versions of your code on-demand.'
  s.authors     = ['Sean Callan']
  s.email       = 'seancallan@gmail.com'
  s.homepage    = 'https://github.com/doomspork/versions.rb'
  s.license     = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.required_ruby_version = '> 1.9'

  s.add_development_dependency 'bundler',     '~> 1.7'
  s.add_development_dependency 'coveralls',   '~> 0.7' unless RUBY_PLATFORM =~ /java/
  s.add_development_dependency 'pry',         '~> 0.10'
  s.add_development_dependency 'rake',        '~> 10.0'
  s.add_development_dependency 'rr',          '~> 1.1.2'
  s.add_development_dependency 'rspec',       '~> 3.1'
  s.add_development_dependency 'simplecov',   '~> 0.9'
end
