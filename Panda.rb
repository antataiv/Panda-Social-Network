class Panda
  attr_accessor :name, :email, :gender

  def initialize(name, email, gender)
    @name = name
    @email = email
    @gender = gender
  end

  def male?
    gender == "male"
  end

  def female?
    gender == "female"
  end

  def to_s
    "Name: #{@name}, Gender: #{@gender}, Email: #{@email}"
  end

  def ==(other)
    to_s == other.to_s
  end

  def hash
    to_s.hash
  end

  alias_method :eql?, :==
end