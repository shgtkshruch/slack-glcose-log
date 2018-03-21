require 'json'
require 'pry-byebug'

res = []

Dir.glob('./glucose/*').each do |file|
  open(file) { |io| JSON.load io }.each.with_index(0) do |object, i|
    if object['type'] == 'message'
      item = {
        timestamp: object.dig('file', 'created'),
        title: object.dig('file', 'title'),
        image: object.dig('file', 'thumb_1024'),
      }
      res.push item
    end
  end
end

File.open('meal.json', 'w') do |f|
  f.puts res.to_json
end
