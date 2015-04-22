require 'forwardable'

require 'versionable.rb'
require 'versions/configurable.rb'
require 'versions/file_helpers.rb'
require 'versions/class_helpers.rb'
require 'versions/string_helpers.rb'
require 'versions/errors/version_not_available.rb'

class Versions
  extend Configurable

  include FileHelpers
  include ClassHelpers
  include StringHelpers

  class << self
    extend Forwardable
    def_delegators :config, :base_dir, :version_pattern, :class_prefix
  end

  # Public: Sets up and returns a new instance
  #
  # mod - Symbol or String of the library name
  #
  # Returns an instance of Versions
  def self.for(library)
    new(library)
  end

  # Public: Sets the base directory for this instance
  #
  # path - path to the directory
  #
  # Returns self
  def at(path)
    @path = path
    self
  end

  # Public: Selects a version
  #
  # version - a version string
  #
  # Returns the versioned Class
  # Raises VersionNotAvailableError
  def select(version)
    version = version.to_sym
    if file = mapped_versions[version]
      load_class(version, file)
    else
      raise VersionNotAvailableError.new "Version #{version} is unavailable."
    end
  end

  # Public: Whether a version is available or not
  #
  # version - a version string
  #
  # Returns a Boolean
  def available?(version)
    !!mapped_versions[version.to_sym]
  end

  # Public: Get the available versions
  #
  # Returns an Array of version strings
  def versions
    mapped_versions.keys.sort
  end

  protected

  # Internal: Create a new instance
  #
  # library - Symbol or String of the library name
  #
  # Returns a new instance
  def initialize(library)
    @library_name = snake_case(library.to_s)
  end

  # Internal: An internal map of versions and their respective files,
  # the Hash keys are version strings and files as value.
  #
  # Returns a Hash
  def mapped_versions
    @file_version_mapping ||= map_file_versions
  end
end

