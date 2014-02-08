require 'simplecov'
require 'coveralls'
require 'pry'

ENV['RACK_ENV'] = 'test'

# Configure code coverage reporting
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '/spec/'
  coverage_dir 'docs/coverage'
end

require 'versions'

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.mock_framework = :rr
end
