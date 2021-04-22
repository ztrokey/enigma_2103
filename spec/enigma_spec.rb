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

  describe '#generate_key' do
    it 'generates a random 5 digit number' do
      enigma = Enigma.new


      expect(enigma.generate_key).to eq([0, 2, 7, 1, 5])
      # expect(enigma.key_generator).to eq('')
    end
  end

  describe '#offset_generator' do
    it 'generates a number based off of date' do
      enigma = Enigma.new

      expect(enigma.offset_generator).to eq(["1", "0", "2", "5"])
      # expect(enigma.offset_generator('040895')).to eq(["1", "0", "2", "5"])
    end
  end

  describe '#shift_assigners' do
    it 'assigns the shifts' do
      enigma = Enigma.new
      enigma.generate_key
      enigma.offset_generator
      # require 'pry'; binding.pry
      expect(enigma.a_shift_assigner).to eq(3)
      expect(enigma.b_shift_assigner).to eq(27)
      expect(enigma.c_shift_assigner).to eq(73)
      expect(enigma.d_shift_assigner).to eq(20)
    end
  end
end