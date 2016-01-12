require_relative 'Panda'
require_relative 'NetworkWriter'

class PandaSocialNetwork
  def initialize
    @data = {}
  end

  def add_panda(panda)
    raise "PandaAlreadyThere" if has_panda(panda)
    @data[panda] = []
  end

  def has_panda(panda)
    @data.has_key?(panda)
  end

  def make_friends(panda1, panda2)
    #TO DO...Throw exception PandasAlreadyFriends if they are already friends
    @data[panda1] = [] unless has_panda(panda1)
    @data[panda2] = [] unless has_panda(panda2)

    @data[panda1] << panda2
    @data[panda2] << panda1
  end

  def are_friends(panda1, panda2)
    @data[panda1].include?(panda2) && @data[panda2].include?(panda1)
  end

  def friends_of(panda)
    return false unless has_panda(panda)
    @data[panda].each { |friend| puts friend }
  end

  def connection_level(panda1, panda2)
    connection_count = 0
    queue = []
    visited = []
    queue << panda1
    visited << panda1

    while queue.any?
      current_panda = queue.shift
      @data[current_panda].each do |panda|
        next if visited.include?(panda)
        queue << panda
        visited << panda
        connection_count += 1
        return connection_count if panda2 == panda
      end
    end

    return -1
  end

  def are_connected(panda1, panda2)
    connection_level(panda1, panda2) != -1
  end

  def how_many_gender_in_network(level, panda, gender)
    gender_count = 0
    @data.each do |panda, panda_friends|
      panda_friends.each { |subpanda, subfriends| gender_count += 1 if subfriends.gender == gender }

    end

    gender_count
  end


  def save(file_name)
    filedata = file_name.split('.')
    formatter = filedata[1].upcase
    formatter_class = Object.const_get("NetworkWriter").const_get(formatter).new
    formatter_class.save(file_name, @data)
  end

  def load(file_name)
  end
end




network = PandaSocialNetwork.new
ivo = Panda.new("Ivo", "ivo@pandamail.com", "male")
ivo2 = Panda.new("Ivo", "ivo@pandamail.com", "male")
rado = Panda.new("Rado", "rado@pandamail.com", "male")
tony = Panda.new("Tony", "tony@pandamail.com", "female")
pesho = Panda.new("Pesho", "pesho@pandamail.com", "other")

network.add_panda(ivo)
#network.add_panda(ivo2)
network.add_panda(rado)
network.add_panda(tony)

#true - Ivo is added to the network
#puts network.has_panda(ivo)
#true - Rado is added to the network
#puts network.has_panda(rado)
#true - Tony is added to the network
#puts network.has_panda(tony)
#false - Pesho is NOT added to the network
#puts network.has_panda(pesho)

network.make_friends(ivo, rado)
#the below line should not work
#network.make_friends(ivo, ivo2)
network.make_friends(ivo, tony)
network.make_friends(ivo, pesho)

#true - Pesho is now added to the network, while being made friends with Rado
#puts network.has_panda(pesho)

#true
#puts network.are_friends(ivo, rado)
#false
#puts network.are_friends(rado, tony)
#true
#puts network.are_friends(tony, ivo)
#true
#puts network.are_friends(rado, pesho)
#false
#puts network.are_friends(pesho, ivo)
#false
#puts network.are_friends(tony, pesho)

#network.friends_of(ivo)
#network.friends_of(rado)
#network.friends_of(tony)
#network.friends_of(pesho)

#puts network.connection_level(ivo, pesho)
puts network.connection_level(ivo, rado) == 1 # true
puts network.connection_level(ivo, tony) == 1 # true
puts network.connection_level(ivo, pesho) == 1 # true

#puts network.are_connected(ivo, rado) #true
#puts network.are_connected(ivo, tony) #false
#puts network.are_connected(pesho, ivo) #false

#network.how_many_gender_in_network(1, rado, "female")

network.save("social_network.json")