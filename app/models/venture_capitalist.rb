class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |capitalist|
            capitalist.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        portfolio = []
        self.funding_rounds.each do |round|
            portfolio << round.startup
        end
        portfolio.uniq
    end

    def biggest_investment
        self.funding_rounds.max do |a, b|
            a.investment <=> b.investment
        end
    end

    def invested(domain)
        invested = 0
        FundingRound.all.each do |round|
            if round.venture_capitalist == self && round.startup.domain == domain
                invested += round.investment
            end
        end
        invested
    end

end
