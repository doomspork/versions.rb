require 'simplecov'

ENV['RACK_ENV'] = 'test'

# Configure code coverage reporting
SimpleCov.start do
  add_filter '/spec/'
  coverage_dir 'docs/coverage'
end

require 'versions'
require 'pry'

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.mock_framework = :rr
end
