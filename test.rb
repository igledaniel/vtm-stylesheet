#!/usr/bin/env ruby

require 'nokogiri'
require 'find'

Find.find('.') do |path|
  if !FileTest.directory?(path) && File.extname(path) == ".xml"
    begin
      bad_doc = Nokogiri::XML(File.read(path)) { |config| 
        config.options = Nokogiri::XML::ParseOptions::STRICT 
      }
    rescue Nokogiri::XML::SyntaxError => e
      puts e
      exit 1
    end
  end
end
