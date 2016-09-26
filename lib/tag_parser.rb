#!/usr/bin/env rubygems
# uses item cleanup methods and import file to create new items

require_relative 'item'
require_relative 'import'
require 'roo-xls'


itemsheet = Roo::Spreadsheet.open('data/vplbl3h9bent.xls')

items = []

# for each line in spreadsheet
2.upto(itemsheet.last_row) do |line|
  name = itemsheet.cell('A', line)
  desc = itemsheet.cell('F', line)
  # create a new item
  item = Item.new(name, desc)
  items << item
end

puts "Created #{items.count} items just now"
