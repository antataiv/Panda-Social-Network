require 'rubygems'
require 'xml'
require 'json'

module NetworkWriter
  class JSONSerializer
    def save(file_name, data)
      File.open(file_name, "w+") do |content|
        content.write(JSON.pretty_generate(data))
      end

      puts "You called JSON file to be saved."
    end
  end

  class XMLSerializer
    def save(file_name, data)
      doc = XML::Document.new()
      doc.root = XML::Node.new('social_network')
      root = doc.root

      data.each do |panda, connections|
        root << panda_element = XML::Node.new('panda')
        panda_element << panda
        panda_element << friend_element = XML::Node.new('friends')
        connections.each do |friend|
          friend_element << current_friend = XML::Node.new('friend')
          current_friend << friend
        end
      end

      doc.save(file_name, :indent => true, :encoding => XML::Encoding::UTF_8)

      puts "You called XML file to be saved."
    end
  end

  class YAMLSerializer
    def save(file_name, data)
      puts "You called YAML file to be saved."
    end
  end
end