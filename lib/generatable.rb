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
end

