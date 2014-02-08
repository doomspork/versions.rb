class Versions
  module StringHelpers
    # Internal: Make a String CamelCase
    #
    # str- to make CamelCase String
    #
    # Returns a String
    def camel_case(str)
      str.to_s.split(/[ _]/).map(&:capitalize).join('')
    end

    # Internal: Make a String snake_case 
    # Implementation borrowed from ActiveSupport
    #
    # str - to make snake_case String
    #
    # Returns a String
    def snake_case(str)
      str.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
    end
  end
end
