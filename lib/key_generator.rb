class KeyGenerator

  def initialize
  end

  def generate_key
    key = '02715'
    # key = '%05d' % rand(5 ** 5)
    key.chars.map(&:to_i)
  end

  def key_assigner
    # c = generate_key[2..3].join.to_i
  end
end