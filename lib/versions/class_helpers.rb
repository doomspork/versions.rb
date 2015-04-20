class Versions
  module ClassHelpers
    protected

    # Internal: The ClassName of the Library
    #
    # Returns a String
    def library_name
      camel_case(@library_name)
    end

    # Internal: Get the fully qualified class name with version
    #
    # version - the version selected
    #
    # Returns a String
    def versioned_class_name(version)
      safe_version = version.to_s.gsub(/\./, '_')
      "#{Versions.config.class_prefix}#{safe_version}::#{library_name}"
    end

    # Internal: Load and return the Class
    #
    # version - the selected version
    # file    - the file path
    #
    # Returns a Class
    def load_class(version, file)
      require file
      name = versioned_class_name(version)
      name.split('::').inject(Object) { |obj, klz| obj.const_get(klz) }
    end
  end
end
