module Configurable

  class Config
    attr_accessor :base_dir, :filename_pattern, :class_prefix 

    BASE_DIR         = File.join(Dir.pwd, 'lib')
    FILENAME_PATTERN = /^v(?:ersion)?[-_]?(\d+(?:\.\d+)*)$/i
    CLASS_PREFIX     = 'V'

    def initialize
      self.base_dir         = BASE_DIR
      self.filename_pattern = FILENAME_PATTERN
      self.class_prefix     = CLASS_PREFIX
    end
  end

  def config
    @config ||= Config.new 
  end
end
