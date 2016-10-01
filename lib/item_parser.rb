#!/usr/bin/env rubygems
# uses item cleanup methods and import file to create new items

require_relative 'item'
require_relative 'import'
require 'roo-xls'


itemsheet = Roo::Spreadsheet.open('data/vplbl3h9bent.xls')

# custom = CSV.open('custom/logs/custom.csv','r')
# puts custom.find{|col| col[0] == '10242'}.values_at(1)
# abort
# puts itemsheet.cell('M', 2)
# abort
# # line 0 and 1 for array
def find_custom(line,num)
  custom = CSV.open('custom/logs/custom.csv','r')
  custom.column(1).each do |i|
    i.to_i
  end
  a = custom.find{|col| col[0] == num }.values_at( line )
  return a
end



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
  item = Item.new(num,nam,wei,pac,pri,cw,rw){
    @line1    = find_custom(1,self.num)
    @line2    = find_custom(2,self.num)
    @brand    = itemsheet.cell('E', line)
    @upc      = itemsheet.cell('M', line)
    @vin      = itemsheet.cell('W', line)
    @symbol   = itemsheet.cell('V', line)
    @slot     = itemsheet.cell('I', line)
  }
  # puts find_custom(1,'41033')
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

puts items.first


# export all items to csv #
##########################
CSV.open('data/tags_to_print.csv', "w", :row_sep => :auto) do |csv|
  csv << header
  allitems.each do |item|
    csv << item
  end
end
