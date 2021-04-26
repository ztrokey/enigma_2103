require 'simplecov'
SimpleCov.start
require './lib/enigma'
require './lib/generatable'
require 'date'

RSpec.describe Enigma do
  describe '#generate_key' do
    it 'generates a random 5 digit number' do
      enigma = Enigma.new('hello world')


      expect(enigma.generate_key.length).to eq(5)
    end
  end

  describe '#offset_generator' do
    it 'generates a number based off of date' do
      enigma = Enigma.new('hello world')

      expect(enigma.offset_generator.length).to eq(4)
    end
  end

  describe '#date_generator' do
    it 'generates todays date' do
      enigma = Enigma.new('hello world')

      expect(enigma.date_generator.class).to eq(String)
    end
  end

  describe '#shift_assigners' do
    it 'assigns the shifts' do
      enigma = Enigma.new('hello world', '02715', '040895')

      expect(enigma.a_shift_assigner).to eq(3)
      expect(enigma.b_shift_assigner).to eq(27)
      expect(enigma.c_shift_assigner).to eq(73)
      expect(enigma.d_shift_assigner).to eq(20)
    end
  end
end
