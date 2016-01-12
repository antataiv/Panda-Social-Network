module NetworkWriter
  class JSON
    def save(file_name, data)
      #File.open(file_name, "w+") do |content|
      #  content.write(JSON.pretty_generate(@data))
      #end

      puts "You called JSON file to be saved."
    end
  end

  class XML
    def save(file_name, data)
      puts "You called XML file to be saved."
    end
  end

  class YAML
    def save(file_name, data)
      puts "You called YAML file to be saved."
    end
  end
end