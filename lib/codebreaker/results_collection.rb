require 'yaml'

module Codebreaker   
  class ResultsCollection 
    attr_accessor :results

  	def initialize
      @results = []
    end

    def save_to(file_name)
  	  File.open(file_name, 'w') {|f| f.write(YAML.dump(self)) }
  	end

  	def self.load_from(file_name)
  	  YAML.load(File.read(file_name))
  	end
  end
end

=begin
collection = Codebreaker::ResultsCollection.new 

collection.results << "123"
puts collection.results.inspect

collection.results << "456"
collection.save_to("test.txt")

collection2 = Codebreaker::ResultsCollection.load_from("test.txt")
puts collection2.results.inspect
=end