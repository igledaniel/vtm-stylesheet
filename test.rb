#!/usr/bin/env ruby

require 'nokogiri'
require 'find'

Find.find('.') do |path|
  if !FileTest.directory?(path) && File.extname(path) == ".xml"
    begin
      file = File.open(path)
      bad_doc = Nokogiri::XML(file) { |config| 
        config.options = Nokogiri::XML::ParseOptions::STRICT 
      }
      file.close
    rescue Nokogiri::XML::SyntaxError => e
      puts e
      exit 1
    end
  end
end
