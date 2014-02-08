require 'spec_helper'

class SampleLibrary
  include Versionable

  versions_path File.join(File.dirname(__FILE__), '..', 'fixtures')
end

describe Versionable do
  subject { SampleLibrary }

  describe '.instance_of!' do
    context 'with available version' do
      it 'will return the class' do
        vers = subject.instance_of!('2.1')
        expect(vers).to instance_of SampleLibrary::V2_1
      end

      context 'with additional paramaters' do
        it 'will pass them to the constructor' do
          vers = subject.instance_of!('2.1', 0, 0)
          expect(vers.one).to eql 0
          expect(vers.two).to eql 0
        end
      end
    end

    context 'with missing version' do
      it 'will be raise an error' do
        expect { subject.instance_of!('4.2.0') }.to raise_error Versions::VersionNotAvailableError
      end
    end
  end

  describe '.instance_of' do
    context 'with missing version' do
      it 'will return nil' do
        vers = subject.instance_of('4.2.0')
        expect(vers).to be_nil
      end
    end
  end

end
