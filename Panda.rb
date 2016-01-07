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
    "#{name} is a #{gender} panda with emai: #{email}"
  end

  def equal_name(other_panda)
    @name == other_panda.name
  end

  def equal_email(other_panda)
    @email == other_panda.email
  end

  def equal_gender(other_panda)
    @gender == other_panda.gender
  end

  def equals(other_panda)
    equal_name(other_panda) && equal_email(other_panda) && equal_gender(other_panda)
  end
end