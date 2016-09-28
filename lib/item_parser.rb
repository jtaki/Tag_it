#!/usr/bin/env rubygems
# uses item cleanup methods and import file to create new items

require_relative 'item'
require_relative 'import'
require 'roo-xls'


itemsheet = Roo::Spreadsheet.open('data/vplbl3h9bent.xls')

header = [ "ItemNumber",
            "DescLine1",
            "DescLine2",
            "Pack",
            "Size",
            "Suffix",
            "Brand",
            "Slot",
            "UPC",
            "VIN",
            "Symbol",
            "Price",
            "PerUnit"
          ]
# for each line in spreadsheet
# importing relevant information
# rows to items
items = []
2.upto(itemsheet.last_row) do |line|
  num     = itemsheet.cell('A', line)
  nam     = itemsheet.cell('F', line)
  wei     = itemsheet.cell('D', line)
  pac     = itemsheet.cell('C', line)
  bra     = itemsheet.cell('E', line)
  pri     = itemsheet.cell('G', line)
  upc     = itemsheet.cell('M', line)
  vin     = itemsheet.cell('W', line)
  sym     = itemsheet.cell('V', line)
  cw      = itemsheet.cell('R', line)
  rw      = itemsheet.cell('S', line)
  slo     = itemsheet.cell('I', line)
  # create a new item
  item = Item.new(num,nam,wei,pac,bra,pri,upc,vin,sym,cw,rw)
  items << item
end

allitems = []
# items to each own array
items.each do |i|
  ary = []
  ary << i.num
  ary << i.line1
  ary << i.line2
  ary << i.pack
  ary << i.weight
  ary << i.suffix
  ary << i.brand
  ary << i.slot
  ary << i.upc
  ary << i.vin
  ary << i.sym
  ary << i.price
  if i.cw == true
    ary << "PER #{i.suffix}"
  else
    ary << "UNIT"
  end

  allitems << ary
end



# tests #
########
puts "Created #{items.count} items just now"

puts items.first


# export all items to csv #
##########################
CSV.open('data/tags_to_print.csv', "w", :row_sep => :auto) do |csv|
  csv << header
  allitems.each do |item|
    csv << item
  end
end
