class Startup
    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def self.find_by_founder(founder_name)
        self.all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.count do |round|
            round.startup == self
        end
    end

    def rounds 
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def total_funds
        self.rounds.sum do |round|
            round.investment
        end
    end

    def investors
        investors = []
        self.rounds.each do |round| 
            investors << round.venture_capitalist
        end
        investors.uniq
    end

    def big_investors
        self.investors.select do |investor|
            investor.total_worth >= 1000000000
        end
    end

end
