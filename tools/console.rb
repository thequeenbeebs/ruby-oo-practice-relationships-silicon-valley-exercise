require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

facebook = Startup.new("Facebook", "Mark Zuckerberg", "Social Media")
google = Startup.new("Google", "Raul Sanchez", "Search Engine")
netflix = Startup.new("Netflix", "Blaire Baker", "Entertainment")

trump = VentureCapitalist.new("Donald Trump", 500.00)
bloomberg = VentureCapitalist.new("Michael Bloomberg", 2000000000.00)
musk = VentureCapitalist.new("Elon Musk", 5000000000.00)

fr1 = FundingRound.new(facebook, trump, "Angel", 50.00)
fr2 = FundingRound.new(google, bloomberg, "Seed", 1000.00)
fr3 = FundingRound.new(netflix, musk, "Pre-Seed", 500.00)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line