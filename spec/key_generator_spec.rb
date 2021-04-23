require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/key_generator'
require 'date'

RSpec.describe KeyGenerator do
  describe '#initialize' do
    it 'exists' do
      key_generator = KeyGenerator.new

      expect(key_generator).to be_a KeyGenerator
    end
  end

  # describe '#key_assigner' do
  #   it 'generates a random 5 digit number' do
  #     key_generator = KeyGenerator.new


  #     expect(key_generator.key_assigner).to eq('')
  #     # expect(enigma.key_generator).to eq('')
  #   end
  # end
end