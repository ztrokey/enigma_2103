module Generatable

  def generate_key
    key = '02715'
    # key = '%05d' % rand(5 ** 5) this does the random with leading 0's
    # key.chars.map(&:to_i) #moved to split assigners
  end

  def offset_generator
    date = '040895' #change this to Time.now.strftime("%d%m%y")
    (date.to_i ** 2).to_s.split(//).last(4)
  end
end

