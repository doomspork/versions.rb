require 'versions/versionable.rb'
require 'versions/configurable.rb'
require 'versions/file_helpers.rb'
require 'versions/class_helpers.rb'

class Versions
  extend Versionable
  extend Configurable

  include FileHelpers
  include ClassHelpers

  # Public: Sets up and returns a new instance
  #
  # mod - Symbol or String of the library name
  #
  # Returns an instance of Versions
  def self.for(mod)
    new(mod)
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
    !!mapped_versions[version]
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
  # mod - Symbol or String of the library name
  #
  # Returns a new instance
  def initialize(mod)
    @library_name = mod.to_s
  end

  # Internal: An internal map of versions and their respective files,
  # the Hash keys are version strings and files as value. 
  #
  # Returns a Hash
  def mapped_versions
    @file_version_mapping ||= map_file_versions
  end
end

