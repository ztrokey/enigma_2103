module Generatable

  def generate_key
    key = '02715'
    # '%05d' % rand(5 ** 5) #this does the random with leading 0's
    # key.chars.map(&:to_i) #moved to split assigners
  end

  def offset_generator
    # Time.now.strftime("%d%m%y") #date = '040895'
    (date_generator.to_i ** 2).to_s.split(//).last(4)
  end

  def date_generator
    '040895'
    # Time.now.strftime("%d%m%y")
  end
end

