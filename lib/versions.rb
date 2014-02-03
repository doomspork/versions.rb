DEPENDENCIES = %w{versionable configurable file_helpers class_helpers}

DEPENDENCIES.each { |d| require File.join(File.dirname(__FILE__), 'versions', "#{d}.rb") }

class Versions
  extend Versionable
  extend Configurable

  include FileHelpers
  include ClassHelpers

  def self.for(mod)
    new(mod)
  end

  def at(path)
    @path = path
    self
  end

  def select(version)
    if file = mapped_versions[version]
      load_class(version, file)
    else
      raise VersionNotAvailableError.new "Version #{version} is unavailable."
    end
  end

  def available?(version)
    !!mapped_versions[version]
  end

  def versions
    mapped_versions.keys.sort
  end

  protected

  def initialize(mod)
    @library_name = mod.to_s
  end

  def mapped_versions
    @file_version_mapping ||= map_file_versions
  end

  def config
    Versions.config
  end
end

