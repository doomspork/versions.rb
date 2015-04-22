module Versionable
  extend Forwardable

  DEFAULT_PATH = File.join(File.dirname(__FILE__), '')

  def_delegators :@versions, :versions, :available?, :select

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def instance_of!(version, *args)
      version         = version.to_sym
      versioned_class = loaded_versions[version]
      instance        = versioned_class.new(*args)
      instance.instance_variable_set(:@instance_version, version)
      instance
    end

    def instance_of(version, *args)
      begin
        instance_of!(version, args)
      rescue Versions::VersionNotAvailableError
        nil
      end
    end

    def versions_path(path)
      @versions_path = path
    end

    private

    def versions_directory
      @versions_path || DEFAULT_PATH
    end

    def loaded_versions
      @loaded_versions ||= Hash.new { |hash, key| hash[key] = versions_rb.select(key) }
    end

    def versions_rb
      @versions_rb ||= Versions.for(self.name).at(versions_directory)
    end
  end
end
