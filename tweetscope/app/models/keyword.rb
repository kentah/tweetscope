class Keyword < ActiveRecord::Base
  def grab_twitts
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Z4TSEYT4kEFNmFy2v38ybMmWp"
      config.consumer_secret     = "foIrVzfXOAwn8SqEymHOjASeEDfl2IVRFzxVSFlmwjw3EJMVAc"
      config.access_token        = "259067979-oHC7BRQ6wk0CGmqHEyR5affXfw6VzxSAtVvWNwjB"
      config.access_token_secret = "rDqaAj6DVJ2FMWvTYXujrBfNQOovAZNKdFsoROgsfrCl3"
    end

    client.search(self.word, result_type: "recent").take(3).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
