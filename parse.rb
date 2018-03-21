require 'json'
require 'pry-byebug'

res = []

Dir.glob('./glucose/*').each do |file|
  open(file) { |io| JSON.load io }.each do |object|
    if object['type'] == 'message' && !object['text'].include?('channel')
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
