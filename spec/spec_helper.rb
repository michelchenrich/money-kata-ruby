require 'simplecov'
SimpleCov.start do 
  minimum_coverage 100.0 
  add_filter '/spec/'
end

require_relative '../lib/object_extension'
Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |file| require file }
