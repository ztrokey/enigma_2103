require 'date'
require './lib/generatable'

class Enigma
  include Generatable

  attr_reader :message,
              :characters,
              :key,
              :date

  def initialize(message, key = generate_key, date = date_generator)
    @message = message
    @key = key
    @date = date
    @characters = (("a".."z").to_a << " ") * 4
    @symbols = []
  end

  def encrypt(message = @message, key = @key, date = @date)
    {encryption: encryptor, key: key, date: date}
  end

  def decrypt(message, key, date)
    {decryption: decryptor, key: key, date: date}
  end

  def message_spliter
    @message.split(//)
  end

  def symbol_remover
    message_spliter.delete_if.with_index do |character, index|
      @symbols << [character, index] if !@characters.include?(character)
    end
  end

  def message_index
    symbol_remover.map do |letter|
      @characters.index(letter)
    end
  end

  def split_array
    message_index.each_slice(4).to_a
  end

  def encrypted_indexes
    encrypted_indexes = []
    split_array.each do |array|
      array.map.with_index do |number, index|
        if index == 0
          encrypted_indexes << number += a_shift_assigner
        elsif index == 1
          encrypted_indexes << number += b_shift_assigner
        elsif index == 2
          encrypted_indexes << number += c_shift_assigner
        elsif index == 3
          encrypted_indexes << number += d_shift_assigner
        end
      end
    end
    encrypted_indexes
  end

  def encryptor
    encrypted_letters = []
    encrypted_indexes.each do |number|
      encrypted_letters  << @characters[number]
    end
    @symbols.each do |symbol|
      encrypted_letters.insert(symbol[1], symbol[0])
    end
    encrypted_letters.join
  end

  def decrypted_indexes
    decrypted_indexes = []
    split_array.each do |array|
      array.map.with_index do |number, index|
        if index == 0
          decrypted_indexes << number -= a_shift_assigner
        elsif index == 1
          decrypted_indexes << number -= b_shift_assigner
        elsif index == 2
          decrypted_indexes << number -= c_shift_assigner
        elsif index == 3
          decrypted_indexes << number -= d_shift_assigner
        end
      end
    end
    decrypted_indexes
  end

  def decryptor
    decrypted_letters = []
    decrypted_indexes.each do |number|
      decrypted_letters  << @characters[number]
    end
    @symbols.each do |symbol|
      decrypted_letters.insert(symbol[1], symbol[0])
    end
    decrypted_letters.join
  end
end