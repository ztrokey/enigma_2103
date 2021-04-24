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

  def message_index
    message_spliter.map do |letter|
      @characters.index(letter)
    end
  end

  def message_open
    file = File.open('message.txt', "r")
    #make a new class runner or message reader
  end

  def message_read
    message_open.read
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

  def decrypt_split_array
    encrypted_indexes.enum_for(:each_slice, 4).to_a
  end

  def decrypted_indexes
    decrypted_indexes = []
    decrypt_split_array.each do |array|
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

  def tester

  end
end
