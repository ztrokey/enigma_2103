module Generatable

  def generate_key
    '%05d' % rand(5 ** 5)
  end

  def offset_generator
    (@date.to_i ** 2).to_s.split(//).last(4)
  end

  def date_generator
    Time.now.strftime("%d%m%y")
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

