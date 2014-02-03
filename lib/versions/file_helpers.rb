module FileHelpers
  protected

  def path
    @path ||= config.base_dir
    File.join(@path, @library_name)
  end

  def parse_filepath(path)
    name   = File.basename(path, '.rb')
    (match = config.filename_pattern.match(name)) ? match[1] : nil
  end

  def map_file_versions
    files    = Dir[File.join(path, '*.rb')]
    files    = {} if files.empty?
    versions = files.each_with_object({}) { |f, obj| obj[parse_filepath(f)] = f }
    versions.delete_if { |k, _| k.nil? }
  end
end
