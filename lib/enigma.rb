class Enigma
  attr_reader :message,
              :characters

  def initialize(message)
    @message = message
    @characters = (("a".."z").to_a << " ") * 4
  end

  def encrypt(message, key, date)
    {
      encryption: '#{message}',
      key: '#{generate_key}',
      date: '#{date}'
    }
  end

  def decrypt(message, key, date)
  end

  def generate_key
    key = '02715'
    # key = '%05d' % rand(5 ** 5) this does the random with leading 0's
    key.chars.map(&:to_i)
  end

  def offset_generator
    date = '040895' #change this to Time.now.strftime("%d%m%Y")
    (date.to_i ** 2).to_s.split(//).last(4)
  end
###make modules
  def a_shift_assigner
    generate_key[0..1].join.to_i + offset_generator[0].to_i
  end

  def b_shift_assigner
    generate_key[1..2].join.to_i + offset_generator[1].to_i
  end

  def c_shift_assigner
    generate_key[2..3].join.to_i + offset_generator[2].to_i
  end

  def d_shift_assigner
    generate_key[3..4].join.to_i + offset_generator[3].to_i
  end

  def message_spliter
    @message.split(//)
  end

  def tester
    message_spliter
    # require 'pry'; binding.pry
  end

  def message_index
    message_spliter.map do |letter|
      @characters.index(letter)
    end
  end

  def message_open
    file = File.open('message.txt', "r")
    #make a new class runner or message reader
    # require 'pry'; binding.pry
  end

  def message_read
    message_open.read
    # file.read
  end

  def split_array
    message_index.enum_for(:each_slice, 4).to_a
  end

  def encrypt_test
    new_indexes = []
    split_array.each do |array|
      array.map.with_index do |number, index|
        if index == 0
          new_indexes << number += a_shift_assigner
        elsif index == 1
          new_indexes << number += b_shift_assigner
        elsif index == 2
          new_indexes << number += c_shift_assigner
        elsif index == 3
          new_indexes << number += d_shift_assigner
        end
      end
    end
    new_indexes
  end

  def encryptor
    encrypted_letters = []
    encrypt_test.each do |number|
      encrypted_letters  << @characters[number]
    end
    encrypted_letters.join
    require 'pry'; binding.pry
  end
end
#take each index from encrpyt_test
#assign it to @characters index

# [6] pry(#<Enigma>)> characters.index('h') + a_shift_assigner
# => 10
# [7] pry(#<Enigma>)> characters[10]
# => "k"

# [10] pry(#<Enigma>)> characters.index(message_spliter[0])
# => 7
# [11] pry(#<Enigma>)> characters.index(message_spliter[0]) + a_shift_assigner
# => 10

# assign char.index(mess_split[index] + shift to variable
# [2] pry(#<Enigma>)> x = characters.index(message_spliter[0]) + a_shift_assigner
# => 10
# then plug variable into characters index
# [3] pry(#<Enigma>)> characters[x]
# => "k"
# then repeat for b, c, and d shifts

# break into sub arrays of 4
# if index == 0 do a shift....
# then flatten at the end
# message_index.enum_for(:each_slice, 4).to_a
# [[7, 4, 11, 11], [14, 26, 22, 14], [17, 11, 3]]