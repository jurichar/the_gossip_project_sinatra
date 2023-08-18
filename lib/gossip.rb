# require 'pry'
require 'csv'

class Gossip
    attr_accessor :author, :content

    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content, ]
        end
    end

    def self.all
        all_gossips = []
        CSV.open("./db/gossip.csv", "r").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id)
        idx = 0
        CSV.open("./db/gossip.csv", "r").each do |csv_line|
            if (id.to_i === idx)
                return Gossip.new(csv_line[0], csv_line[1])
            end
            idx += 1
        end
    end
end

# binding.pry