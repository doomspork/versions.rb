class Versions
  module FileHelpers
    protected

    # Internal: Parse a file path into a version string
    #
    # path - the file path to parse
    #
    # Returns a version String or nil
    def parse_filepath(path)
      (match = Versions.config.version_pattern.match(path)) ? match[1] : nil
    end

    # Internal: Create a map of versions and files
    #
    # Returns a Hash
    def map_file_versions
      file_path = File.join(path, '**', "#{@library_name}.rb")
      files = Dir[file_path] || {}
      files.inject({}) do |memo, path|
        version_key = parse_filepath(path)
        memo[version_key.to_sym] = path if version_key
        memo
      end
    end

    def path
      @path ||= Versions.config.base_dir
    end
  end
end
