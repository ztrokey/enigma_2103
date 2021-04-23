require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  describe '#initialize' do
    it 'exists' do
      enigma = Enigma.new('hello world')

      expect(enigma).to be_a Enigma
    end

    it 'has attributes' do
      enigma = Enigma.new('hello world')

      expect(enigma.message).to eq('hello world')
    end
  end

  describe '#generate_key' do
    it 'generates a random 5 digit number' do
      enigma = Enigma.new('hello world')


      expect(enigma.generate_key).to eq([0, 2, 7, 1, 5])
      # expect(enigma.key_generator).to eq('')
    end
  end

  describe '#offset_generator' do
    it 'generates a number based off of date' do
      enigma = Enigma.new('hello world')

      expect(enigma.offset_generator).to eq(["1", "0", "2", "5"])
      # expect(enigma.offset_generator('040895')).to eq(["1", "0", "2", "5"])
    end
  end

  describe '#shift_assigners' do
    it 'assigns the shifts' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator

      expect(enigma.a_shift_assigner).to eq(3)
      expect(enigma.b_shift_assigner).to eq(27)
      expect(enigma.c_shift_assigner).to eq(73)
      expect(enigma.d_shift_assigner).to eq(20)
    end
  end

  describe '#message_spliter' do
    it 'splits a string into an array' do
      enigma = Enigma.new('hello world')


      expected = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
      expect(enigma.message_spliter).to eq(expected)
    end
  end

  describe '#message_index' do
    it 'gives index location of each letter in message' do
      enigma = Enigma.new('hello world')

      expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
      expect(enigma.message_index).to eq(expected)
    end
  end

  describe '#message_read' do
    it 'opens and reads a file' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter
      enigma.message_open

      expect(enigma.message_read).to eq('hello world')
    end
  end

  describe '#tester' do
    xit 'this is just for me to test stuff' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter

      expect(enigma.tester).to eq('nothing')
    end
  end
end