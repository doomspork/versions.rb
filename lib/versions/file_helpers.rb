class Versions
  module FileHelpers
    protected

    # Internal: Gets the path to the library's versions
    #
    # Return a directory path
    def library_path
      @path ||= Versions.config.base_dir
      File.join(@path, @library_name)
    end

    # Internal: Parse a file path into a version string
    #
    # path - the file path to parse
    #
    # Returns a version String or nil
    def parse_filepath(path)
      name   = File.basename(path, '.rb')
      (match = Versions.config.filename_pattern.match(name)) ? match[1] : nil
    end

    # Internal: Create a map of versions and files
    #
    # Returns a Hash
    def map_file_versions
      files    = Dir[File.join(library_path, '*.rb')]
      files    = {} if files.empty?
      files.inject({}) do |memo, f| 
        version_key      = parse_filepath(f)
        memo[version_key.to_sym] = f if version_key
        memo 
      end
    end
  end
end
