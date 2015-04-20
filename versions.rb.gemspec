Gem::Specification.new do |s|
  s.name        = 'versions.rb'
  s.version     = '0.1.1' 
  s.summary     = 'Ruby class versioning made simple.'
  s.description = 'Versions.rb provides a simple method for handling libraries that require versioning.'
  s.authors     = ['doomspork']
  s.email       = 'iamdoomspork@gmail.com'
  s.files       = ['lib/versions.rb', 'LICENSE']
  s.homepage    = 'https://github.com/doomspork/versions.rb'
  s.license     = 'MIT'

  s.required_ruby_version = '> 1.9'

  s.add_development_dependency 'bundler',     '~> 1.7'
  s.add_development_dependency 'coveralls',   '~> 0.7' unless RUBY_PLATFORM =~ /java/
  s.add_development_dependency 'pry',         '~> 0.10'
  s.add_development_dependency 'rake',        '~> 10.0'
  s.add_development_dependency 'rr',          '~> 1.1.2'
  s.add_development_dependency 'rspec',       '~> 3.1'
  s.add_development_dependency 'simplecov',   '~> 0.9'
end
