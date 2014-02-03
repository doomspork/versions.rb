require 'spec_helper'

describe Versions do
  subject { Versions.for(:sample_library) }

  let(:fixture_path) { File.join(File.dirname(__FILE__), '..', 'fixtures') }

  before { Versions.config.base_dir = fixture_path }

  describe '#available?' do
    context 'with existing version' do
      it 'will be true' do
        avail = subject.available? '1'
        expect(avail).to be_true
      end
    end

    context 'with missing version' do
      it 'will be false' do
        avail = subject.available? '4.2.0'
        expect(avail).to be_false
      end
    end
  end

  describe '#versions' do
    it 'returns an Array of available versions' do
      vers = subject.versions
      expect(vers.size).to eql 3
    end
  end

  describe '#at' do
    before { Versions.config.base_dir = nil }

    it 'will override the base dir for this instance' do
      vers = subject.at(fixture_path).versions
      expect(vers.size).to eql 3
    end
  end

  describe '#select' do
    context 'with available version' do
      it 'will return the class' do
        vers = subject.select('2.1')
        expect(vers).to eql SampleLibrary::V2_1
      end
    end

    context 'with missing version' do
      it 'will be raise an error' do
        expect { subject.select('4.2.0') }.to raise_error 
      end
    end
  end

end
