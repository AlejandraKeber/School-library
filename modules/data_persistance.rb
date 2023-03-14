require 'json'
class DataPersistance
  def initialize
    @data = nil
  end

  def save(name, data = nil)
    return puts 'Invalid name, data not saved.' unless name != ''
    return puts 'Nothing to save' unless data

    json_data = JSON.generate(data)
    File.write("#{name}.json", json_data)
    return true
  end
end
