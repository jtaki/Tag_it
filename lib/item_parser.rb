#!/usr/bin/env rubygems
# uses item cleanup methods and import file to create new items

require_relative 'item'
require 'roo-xls'
# require_relative './tagit/compile'

include Helper
include Compiler

compiler


itemsheet = Roo::Spreadsheet.open('data/vplbl3h8c.xls',csv_options: {encoding: Encoding::UTF_8})
custom = Roo::Spreadsheet.open('custom/logs/custom.csv', csv_options: {encoding: Encoding::ISO_8859_1})
custom = custom.parse(num: 'ITEM', c1: 'Custom1', c2:'Custom2')



header = [ "ItemNumber",
            "DescLine1",
            "DescLine2",
            "PackSize",
            "Brand",
            "UPC",
            "VIN",
            "Symbol",
            "Price",
            "PerUnit",
            "ComparativePrice",
            "ComparativeUnits",
            "VenderID"
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
  vid      = itemsheet.cell('N', line)
  item = Item.new(num,nam,wei,pac,pri,cw,rw,brand,upc,vin,sym,vid)

  items << item
end


allitems = []
# items to each own array
items.each do |i|
  ary = []
  ary << i.num
  ary << i.find_custom(custom).to_s.upcase
  ary << i.find_custom2(custom).to_s.upcase
  ary << "#{i.pack} / #{i.weight} #{i.suffix}"
  ary << i.brand << i.upc << i.vin << i.sym
  # price conditional for CW
  if (i.cw == true) && (i.rw == false)
    ary << "$#{(cwtolb( i.suffix, i.weight ) * i.pack).round(3) * i.price}"
  else
    ary << "$#{i.price}"
  end

  if i.rw == true
    ary << "PER #{i.suffix}"
  else
    ary << "UNIT"
  end
  ary << i.comp_price
  ary << i.comp_unit << i.vid



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
