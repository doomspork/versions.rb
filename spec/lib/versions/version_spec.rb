require 'spec_helper'

describe Versions do
  describe '.version' do
    it 'will be valid version' do
      v = Versions.version
      expect(v).to match /\d\.\d\.\d/
    end
  end
end
