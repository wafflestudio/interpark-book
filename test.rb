$LOAD_PATH.unshift 'lib'
require 'interpark/book'

Interpark::Book.configure do |config|
  config.key = File.exists?("api_key") ? File.read("api_key").strip : "API_KEY"
end

title = "삼국지"

res = Interpark::Book::Search.query(title)

puts res["link"]
puts res["item"].count
