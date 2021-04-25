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

    xit 'has attributes' do
      enigma = Enigma.new('hello world')

      expect(enigma.message).to eq('hello world')
      expect(enigma.key).to eq('02715')
      expect(enigma.date).to eq('040895')
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

  # describe '#message_read' do
  #   it 'opens and reads a file' do
  #     enigma = Enigma.new('hello world')
  #     enigma.generate_key
  #     enigma.offset_generator
  #     enigma.message_spliter
  #     enigma.message_open

  #     expect(enigma.message_read).to eq('hello world')
  #   end
  # end

  describe '#split_array' do
    it 'creates sub arrays' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter

      expected = [[7, 4, 11, 11], [14, 26, 22, 14], [17, 11, 3]]
      expect(enigma.split_array).to eq(expected)
    end
  end

  describe '#encrypted_indexes' do
    it 'tests encryption' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter

      expected = [10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76]
      expect(enigma.encrypted_indexes).to eq(expected)
    end
  end

  describe '#encryptor' do
    it 'assigns new indexes' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter
      enigma.encrypted_indexes

      expect(enigma.encryptor).to eq("keder ohulw")
    end
  end

  describe '#decrypt_split_array' do
    it 'splits encrypted indexes into sub arrays' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter
      enigma.encrypted_indexes

      expected = [[10, 31, 84, 31], [17, 53, 95, 34], [20, 38, 76]]
      expect(enigma.decrypt_split_array).to eq(expected)
    end
  end

  describe '#decrypted_indexes' do
    it 'decrypts indexes to oringal' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter
      enigma.encrypted_indexes

      expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
      expect(enigma.decrypted_indexes).to eq(expected)
    end
  end

  describe '#decryptor' do
    it 'decrypts indexes to string' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter
      enigma.encrypted_indexes


      expect(enigma.decryptor).to eq('hello world')
    end
  end

  describe '#encrypt' do
    it 'shows the message, key and date' do
      enigma = Enigma.new('hello world')
      # enigma.generate_key
      # enigma.offset_generator
      # enigma.message_spliter
      # enigma.encrypted_indexes


      expect(enigma.encrypt(@message, @key, @date)).to eq('hello world')
    end
  end

  describe '#tester' do
    it 'this is just for me to test stuff' do
      enigma = Enigma.new('hello world')
      enigma.generate_key
      enigma.offset_generator
      enigma.message_spliter

      expect(enigma.tester).to eq('nothing')
    end
  end
end