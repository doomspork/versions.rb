class Versions
  module Configurable

    # A simple configuration wrapper
    class Config
      attr_accessor :base_dir, :filename_pattern, :class_prefix 

      # The default base directory path
      BASE_DIR         = File.join(Dir.pwd, 'lib')
      # The default filename pattern
      FILENAME_PATTERN = /^v(?:ersion)?[-_]?(\d+(?:\.\d+)*)$/i
      # The default class prefix
      CLASS_PREFIX     = 'V'

      # Public: Create a new instance with default values
      #
      # Returns a new instance
      def initialize
        self.base_dir         = BASE_DIR
        self.filename_pattern = FILENAME_PATTERN
        self.class_prefix     = CLASS_PREFIX
      end
    end

    # Public: Versions.rb configuration instance
    #
    # Returns an instance of Config
    def config
      @config ||= Config.new 
    end
  end
end
