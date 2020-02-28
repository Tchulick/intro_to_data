require "http"

response = HTTP.get("https://www.reddit.com/r/photography/.json")
page_info = response.parse

i = 0
while i < page_info["data"]["children"].length
  title = page_info["data"]["children"][i]["data"]["title"]
  puts "#{i + 1}. #{title}"
  i += 1
end

# require "tty-prompt"

# prompt = TTY::Prompt.new

# prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
