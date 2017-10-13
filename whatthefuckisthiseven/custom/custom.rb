#!usr/bin/env ruby

require 'roo'
require 'roo-xls'
require './lib/item'
require './lib/tagit/item_helper'


include Helper
# Load array of item numbers to upload.
importsheet = Roo::Spreadsheet.open("data/vplbl3h8c.xls",csv_options: {encoding: Encoding::UTF_8})

imports = []
2.upto(importsheet.last_row) do |line|
  item = {
    num: importsheet.cell("A", line).to_i.parent,
    desc: clean_names(importsheet.cell("F", line))
  }
  imports << item
end

# return array of hash values for num symbol
imports_numbers = []
imports.each do |x|
  n = x.values_at(:num)
  unless is_child(n)
    unless imports_numbers.include?(n)
        imports_numbers << n
    end
  end
end

imports_numbers.uniq!


existing = Roo::Spreadsheet.open('custom/logs/custom.csv',csv_options: {encoding: Encoding::ISO_8859_1})
array = []
2.upto(existing.last_row) do |line|
  item = {
    num: existing.cell("A", line).to_i
  }
    array << item
end

existing_numbers = []
array.each do |x|
  n = x.values_at(:num)
  existing_numbers << n
end

unnamed_nums = imports_numbers - existing_numbers

# # # for each unnamed num, match item info back in from importsheet
@exports = imports.select  { |h| unnamed_nums.include?(h.values_at(:num)) }


CSV.open('data/rename_these.csv', "w", :row_sep => :auto) do |csv|
  csv << ['ITEM','OLD NAME', 'Custom1', 'Custom2']
  @exports.each do |e|
    csv << [e.values_at(:num), e.values_at(:desc)].flatten
  end
end

puts "#{@exports.count} items to rename"
