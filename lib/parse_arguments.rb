#!/usr/bin/env ruby
require 'optparse'

class ParseArguments

 def self.parse
  options = {}
  OptionParser.new do |opts|
   opts.banner = "Usage: jstudy [command] [options]"

   opts.on("--kunyomi [KUNYOMI]", "The kunyomi") do |kunyomi|
    options[:kunyomi] = kunyomi
   end

   opts.on("--english [ENGLISH]", "The english translation") do |english|
    options[:english] = english
   end

   opts.on("--JLPTlevel [JLPTLEVEL]", "The JLPT level") do |jlptlevel|
    options[:jlptlevel] = jlptlevel
   end

   opts.on("--category [CATEGORY]", "The word category") do |category|
    options[:category] = category
   end
  end.parse!
  options
 end

 def self.validate options
  errors = []
  missing_things = []
  missing_things << "kunyomi" unless options[:kunyomi]
  missing_things << "english" unless options[:english]
  missing_things << "jlpt level" unless options[:jlptlevel]
  missing_things << "category" unless options[:category]
  unless missing_things.empty?
   errors << "You must provide the #{missing_things.join(" and ")} of the word you are adding."
  end
  errors
 end

end