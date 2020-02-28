require "http"

require "tty-prompt"

prompt = TTY::Prompt.new

response = HTTP.get("https://www.reddit.com/r/photography/.json")
page_info = response.parse

i = 0
page_array = []
while i < page_info["data"]["children"].length
  title = page_info["data"]["children"][i]["data"]["title"]
  # puts "#{i + 1}. #{title}"
  page_array << title
  i += 1
end

prompt.select("Which page would you like to visit?", page_array)
