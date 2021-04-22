class Enigma
  attr_reader :characters

  def initialize
    @characters = ("a".."z").to_a << " "

  end

  def encrypt(string, key, date)
  end

  def decrypt(string, key, date)
  end

  def generate_key
    key = '02715'
    # key = '%05d' % rand(5 ** 5) this does the random
    key.chars.map(&:to_i)
  end

  def offset_generator
    date = '040895' #change this to Time.now.strftime("%d%m%Y")
    (date.to_i ** 2).to_s.split(//).last(4)
  end

  # def offset_generator(date)
  #   integer = date.to_i ** 2
  #   integer.to_s.split(//).last(4)
  # end

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
end