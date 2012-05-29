module ActsAsCsv 
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods 
    def acts_as_csv 
      include InstanceMethods
    end 
  end 
end 

module InstanceMethods 
  
  def each
    @csv_contents.each { |row| yield row }
  end
  
  def read
    @csv_contents = []
    filename = self.class.to_s.downcase + '.txt'
    file = File.new(filename)
    @headers = file.gets.chomp.split(', ')
    
    file.each do |row|
      @csv_contents << RubyRow.new(@headers, row.chomp.split(', '))
    end 
  end 
    
  attr_accessor :headers, :csv_contents
    
  def initialize 
    read 
  end 
end 

class RubyCsv 
  include ActsAsCsv 
  acts_as_csv
end 

class RubyRow 
  
  def initialize (headers, values) 
    @headers = headers
    @values = values 
  end 
  
  def method_missing name, *args 
    method = name.to_s
    i = @headers.index(method) 
    @values[i] if i   
  end 
end 

csv = RubyCsv.new 
csv.each {|row| puts row.one}