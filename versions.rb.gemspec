Gem::Specification.new do |s|
  s.name        = 'versions.rb'
  s.version     = '0.1.0'
  s.summary     = 'Library versioning made simple.'
  s.description = 'Versions.rb provides a simple means to loading versioned libraries.'
  s.authors     = ['doomspork']
  s.email       = 'iamdoomspork@gmail.com'
  s.files       = ['lib/versions.rb']
  s.homepage    = 'https://github.com/doomspork/versions.rb'
  s.license     = 'MIT'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rr',         '~> 1.1.2'
  s.add_development_dependency 'rspec',      '~> 2.14.1'
  s.add_development_dependency 'simplecov',  '~> 0.8.2'
end
