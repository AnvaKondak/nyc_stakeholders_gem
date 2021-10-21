require "nyc_stakeholders/version"
require "unirest"

module NycStakeholders
  class Error < StandardError; end
  class Stakeholder

      attr_reader :title, :gender

      def initialize(input_options)
        @title = input_options["rank_title"]  
        @gender = input_options["gender"] 
      end

      def self.all
        Unirest.get("https://data.cityofnewyork.us/resource/eddp-3v5g.json")
        .body
        .map { |stakeholder| Stakeholder.new(stakeholder) }
      end
      
        def self.find(parameter_option)
          Unirest.get("https://data.cityofnewyork.us/resource/eddp-3v5g.json?rank_title=#{parameter_option}")
          .body
          .map {|stakeholder| Stakeholder.new(stakeholder) }
        end

        def self.freqjob
          stakeholders = Unirest.get("https://data.cityofnewyork.us/resource/eddp-3v5g.json")
          .body
          .map {|stakeholder| stakeholder["rank_title"] }
         puts stakeholders.uniq.max_by { |n| stakeholders.count(n) } 
         puts stakeholders.uniq.map { |n| stakeholders.count(n) }.max 
        end
  end
end
