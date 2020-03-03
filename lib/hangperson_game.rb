class HangpersonGame
attr_accessor :word , :guesses , :wrong_guesses, :displayed
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @displayed = ''
  end

  def guess(letter)

    if (letter == '' || letter == NIL || !letter.match(/[A-Za-z]/))
        raise ArgumentError, "No null or non letter"
    end

#case insensitive 
    letter.downcase!
#now check to see if it is in the word and add it to guesses or not in the word and add it to wrong guesses
    if @word.include?(letter) && !@guesses.include?(letter)
        @guesses << letter
        return true
    elsif !@word.include?(letter) && !@wrong_guesses.include?(letter)
        @wrong_guesses << letter
        return true
    else 
        return false
    end
  end

  def word_with_guesses
    @displayed = ""
    @word.each_char do |letter|
      if @guesses.include?(letter)
        @displayed << letter
      else
        @displayed << "-"
      end
    end
    @displayed
  end

 def check_win_or_lose
    if @wrong_guesses.length == 7
      return :lose
    end
    if not word_with_guesses.include? "-"
      return :win
    end 
    return :play
    end

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
