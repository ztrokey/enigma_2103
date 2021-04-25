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

  def message_index
    message_spliter.map do |letter|
      @characters.index(letter)
    end
  end

  def split_array
    message_index.enum_for(:each_slice, 4).to_a
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
    decrypted_letters.join
  end

  def a_shift_assigner
    @key.chars.map(&:to_i)[0..1].join.to_i + offset_generator[0].to_i
  end

  def b_shift_assigner
    @key.chars.map(&:to_i)[1..2].join.to_i + offset_generator[1].to_i
  end

  def c_shift_assigner
    @key.chars.map(&:to_i)[2..3].join.to_i + offset_generator[2].to_i
  end

  def d_shift_assigner
    @key.chars.map(&:to_i)[3..4].join.to_i + offset_generator[3].to_i
  end
end

#remove the symbols and store them in the @sym arr
#in or after the tor's, put the symbols back at thier index
#if after the tor's, remove .join and add to new method
# [1] pry(#<Enigma>)> decrypted_letters
# => ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
# [2] pry(#<Enigma>)> decrypted_letters.join
# => "hello world"

  # def symbol_indexer
  #   removed_symbols = []
  #   message_spliter.each.with_index do |character, index|
  #     removed_symbols << [character, index] if @characters.include?(character) == false
  #   end
  #   removed_symbols.flatten
  # end

  # def symbol_remover
  #   message_spliter
  #   message_spliter.delete_at(symbol_indexer[1])
  #   message_spliter
  # end

  # def message_spliter
  #   @message.split(//)#.delete_if.with_index do |character, index|
    #   @symbols << [character, index] if @characters.include?(character) == false
    # end
    # require 'pry'; binding.pry
  # end
# end

# [3] pry(#<Enigma>)> @message.split(//).delete_if { |character| @characters.include?(character) == false }
# => ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]









