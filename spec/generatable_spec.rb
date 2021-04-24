require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/generatable'
require 'date'

RSpec.describe Enigma do
  describe '#generate_key' do
    it 'generates a random 5 digit number' do
      enigma = Enigma.new('hello world')


      expect(enigma.generate_key).to eq('02715')
      # need to use mocks and stubs!!!
    end
  end

  describe '#offset_generator' do
    it 'generates a number based off of date' do
      enigma = Enigma.new('hello world')

      expected = ["1", "0", "2", "5"]
      expect(enigma.offset_generator).to eq(expected)
    end
  end
end
