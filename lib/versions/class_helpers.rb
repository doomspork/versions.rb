class Versions
  module ClassHelpers
    protected

    # Internal: Turn a snake_case name into CamelCase
    #
    # lib_name - the library name in snake_case or CamelCase
    #
    # Returns a CamelCased String
    def camelcase(lib_name)
      lib_name.split(/_/).map(&:capitalize).join('')
    end

    # Internal: The ClassName of the Library
    #
    # Returns a String
    def library_name
      camelcase(@library_name)
    end

    # Internal: Get the fully qualified class name with version
    #
    # version - the version selected
    #
    # Returns a String
    def versioned_class_name(version)
      safe_version = version.gsub(/\./, '_')
      "#{library_name}::#{Versions.config.class_prefix}#{safe_version}"
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
