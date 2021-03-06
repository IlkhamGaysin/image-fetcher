# frozen_string_literal: true

RSpec.describe SimpleImagesDownloader::Line do
  describe '#uri' do
    subject(:uri) { described_class.new(string).uri }

    let(:string) { Faker::Placeholdit.image }

    context 'when string is valid url and has valid extension' do
      let(:image_path_validator) { instance_double('SimpleImagesDownloader::ImagePathValidator') }

      it 'returns instance of URI' do
        expect(uri).to eql(URI(string))
      end

      it 'calls #validate on instance of SimpleImagesDownloader::ImagePathValidator' do
        expect(SimpleImagesDownloader::ImagePathValidator).to receive(:new).and_return(image_path_validator).once
        expect(image_path_validator).to receive(:validate).once

        uri
      end
    end

    context 'when string is nil' do
      let(:string) { nil }

      it do
        expect { uri }.to raise_error(SimpleImagesDownloader::Errors::BadUrl)
      end
    end
  end
end
