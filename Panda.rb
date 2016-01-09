class Panda
  attr_accessor :name, :email, :gender

  def initialize(name, email, gender)
    @name = name
    @email = email
    @gender = gender
  end

  def ==(other)
    to_s == other.to_s
  end

  def male?
    gender == "male"
  end

  def female?
    gender == "female"
  end

  def to_s
    "#{@name} is a #{@gender} panda with email: #{@email}"
  end

  def hash
    to_s.hash
  end

alias_method :eql?, :==

end

ivo = Panda.new("Ivo", "ivo@pandamail.com", "male")
ivo2 = Panda.new("Ivo", "ivo@pandamail.com", "male")
ivo3 = Panda.new("ivo","ivo@abv.bg", "male")

puts ivo == ivo3
puts ivo.hash == ivo2.hash
#
#puts ivo.hash
#puts ivo2.hash
#puts ivo.hash == ivo2.hash
