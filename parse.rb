require 'json'
require 'pry-byebug'

res = []

Dir.glob('./glucose/*').each do |file|
  open(file) { |io| JSON.load io }.each.with_index(0) do |object, i|
    if i > 1 && object['type'] == 'message'
      if object['file'].nil?
        item = {
          timestamp: object.dig('ts').to_i.floor,
          title: object.dig('text'),
          image: ''
        }
      else
        item = {
          timestamp: object.dig('file', 'created'),
          title: object.dig('file', 'title'),
          image: object.dig('file', 'thumb_1024')
        }
      end
      res.push item
    end
  end
end

File.open('./src/assets/meal.json', 'w') do |f|
  f.puts res.to_json
end
