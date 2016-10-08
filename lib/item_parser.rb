#!/usr/bin/env rubygems
# uses item cleanup methods and import file to create new items

require_relative 'item'
# require_relative 'import'
require 'roo-xls'



abort
itemsheet = Roo::Spreadsheet.open('data/vplbl3h9bent.xls',csv_options: {encoding: Encoding::UTF_8})


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
            "PerUnit",
            "ComparativePrice",
            "ComparativeUnits"
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
  pri     = itemsheet.cell('G', line)
  cw      = itemsheet.cell('R', line)
  rw      = itemsheet.cell('S', line)
  brand    = itemsheet.cell('E', line)
  upc      = itemsheet.cell('M', line)
  vin      = itemsheet.cell('W', line)
  sym      = itemsheet.cell('V', line)
  slot     = itemsheet.cell('I', line)
  item = Item.new(num,nam,wei,pac,pri,cw,rw,brand,upc,vin,sym,slot)

  items << item
end


allitems = []
# items to each own array
items.each do |i|
  ary = []
  ary << i.num
  ary << i.find_custom
  ary << i.find_custom
  ary << i.pack
  ary << i.weight
  ary << i.suffix
  ary << i.brand
  ary << i.slot
  ary << i.upc
  ary << i.vin
  ary << i.sym
  ary << "$#{i.price}"
  if i.cw == true
    ary << "PER #{i.suffix}"
  else
    ary << "UNIT"
  end
  ary << i.comp_price
  ary << i.comp_unit

  allitems << ary
end



# tests #
########
puts "Created #{items.count} items just now"

puts items.first.num


# export all items to csv #
##########################
CSV.open('data/tags_to_print.csv', "w", :row_sep => :auto) do |csv|
  csv << header
  allitems.each do |item|
    csv << item
  end
end
