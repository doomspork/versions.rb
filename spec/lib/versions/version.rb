require 'spec_helper'

describe Versions do
  subject { Versions }

  describe 'VERSION' do
    it 'will be valid version' do
      v = subject::VERSION
      expect(v).to match /\d\.\d\.\d/
    end
  end

  describe '.version' do
    it 'will be valid version' do
      v = subject.version
      expect(v).to match /\d\.\d\.\d/
    end
  end
end
