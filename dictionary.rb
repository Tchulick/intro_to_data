# Exercise: Build a terminal dictionary app
# Create a new ruby file called dictionary_app.rb
# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition: https://developer.wordnik.com/docs#!/word/getDefinitions
# Once that works, have it also display the top example and pronunciation (browse through the documentation to the top example and pronunciation).
# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.
# Bonus: Search for the audio section in the documentation. Use wordnik’s audio api to get the first fileUrl to open in the browser (you’ll need to google this!) and pronounce the name of the word.

# https://api.wordnik.com/v4/word.json/jerk/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=8c5e16a77ad41ee83c00a04a8760c80ce83ae19ce509db930

require "http"

def dictionary_class()
  i = 0
  while i < 1
    puts
    puts "Welcome to my terminal dictionary!"
    puts
    puts "Please enter a word and I will give you the definition:"
    word = gets.chomp

    response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=8c5e16a77ad41ee83c00a04a8760c80ce83ae19ce509db930")
    dictionary_data = response.parse

    response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=8c5e16a77ad41ee83c00a04a8760c80ce83ae19ce509db930")
    pronounce_data = response.parse
    # puts response.parse[0]

    definition = dictionary_data[0]["text"]
    part_of_speech = dictionary_data[0]["partOfSpeech"]
    pronounce_info = pronounce_data[0]["raw"]

    puts
    puts "Your word is: #{word}"
    puts "Definition: #{definition}"
    puts "Part of speech: #{part_of_speech}"
    puts "You pronouce #{word}: #{pronounce_info}"
    puts
    puts "Would you like to seach another word?"
    puts "Please answer 'yes' or 'no'"
    answer = gets.chomp
    if answer.downcase == "yes"
      dictionary_class()
    elsif answer.downcase == "no"
      puts
      puts "Thanks for using the dictionary app!"
      i += 1
    end
  end
end

dictionary_class()

# pp response.parse
