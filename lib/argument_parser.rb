#!/usr/bin/env ruby
require 'optparse'

class ArgumentParser

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

   opts.on("--jlptlevel [JLPTLEVEL]", "The JLPT level") do |jlptlevel|
    options[:jlptlevel] = jlptlevel
   end

   opts.on("--category [CATEGORY]", "The word category") do |category|
    options[:category] = category
   end

   opts.on("--id [ID]", "The id of the word we are editing") do |id|
    options[:id] = id
   end

   opts.on("--environment [ENV]", "The database environment") do |env|
    options[:environment] = env
   end

   opts.on("--abilitylevel [ABL]", "The ability level for the word") do |abl|
    options[:abilitylevel] = abl
   end

  end.parse!
  options[:command] = ARGV[0]
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

 def self.getlevel options
  level = options[:jlptlevel]
  level
 end

 def self.getdata options
  data = []
  data << options[:jlptlevel]
  data << options[:abilitylevel]
 end

end