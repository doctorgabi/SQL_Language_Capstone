#!/usr/bin/env ruby
require 'optparse'

class ParseArguments

 def self.parse
  options = { environment: "production"}
  OptionParser.new do |opts|
   opts.banner = "Usage: jstudy [command] [options]"

   opts.on("--kanji [KANJI]", "The kanji") do |kanji|
    options[:kanji] = kanji
   end

   opts.on("--onyomi [ONYOMI]", "The onyomi pronunciation") do |onyomi|
    options[:onyomi] = onyomi
   end

   opts.on("--kunyomi [KUNYOMI]", "The kunyomi pronunciation") do |kunyomi|
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

   opts.on("--environment [ENV]", "The database environment") do |env|
    options[:environment] = env
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