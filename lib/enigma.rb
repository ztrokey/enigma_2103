class Enigma

  def initialize
  end

  def encrypt(string, key, date)
  end

  def decrypt(string, key, date)
  end

  def key_generator
    '%05d' % rand(5 ** 5)
  end

  def offset_generator(date)
    integer = date.to_i ** 2
    integer.to_s.split(//).last(4).join
  end
end