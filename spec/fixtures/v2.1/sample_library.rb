module V2_1
  class SampleLibrary
    attr_accessor :one, :two

    def initialize(one = 1, two = 2)
      self.one = one
      self.two = two
    end

    def version
      '2.1'
    end
  end
end
