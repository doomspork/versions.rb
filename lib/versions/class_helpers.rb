module ClassHelpers
  protected

  def classify(lib_name)
    lib_name.split(/_/).map(&:capitalize).join('')
  end

  def class_name
    classify(@library_name)
  end

  def versioned_class_name(version)
    safe_version = version.gsub(/\./, '_')
    "#{class_name}::#{config.class_prefix}#{safe_version}"
  end

  def load_class(version, file)
    require file
    name = versioned_class_name(version)
    name.split('::').inject(Object) { |obj, klz| obj.const_get klz }
  end
end
