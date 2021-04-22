require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  describe '#initialize' do
    it 'exists' do
      enigma = Enigma.new

      expect(enigma).to be_a Enigma
    end
  end

  describe '#key_generator' do
    xit 'generates a random 5 digit number' do
      enigma = Enigma.new

      expect(enigma.key_generator).to eq('')
    end
  end

  describe '#offset_generator' do
    it 'generates a number based off of date' do
      enigma = Enigma.new

      expect(enigma.offset_generator('040895')).to eq('1025')
    end
  end
end