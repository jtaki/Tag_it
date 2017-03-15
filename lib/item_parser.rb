#!/usr/bin/env rubygems
require_relative 'item'
require 'roo-xls'
require_relative './tagit/compile'

include Helper
include Compiler

compiler


itemsheet = Roo::Spreadsheet.open('data/vplbl3h8c.xls',csv_options: {encoding: Encoding::UTF_8})
custom = Roo::Spreadsheet.open('custom/logs/custom.csv', csv_options: {encoding: Encoding::ISO_8859_1})
custom = custom.parse(num: 'ITEM', c1: 'Custom1', c2:'Custom2')

puts "categories: All(A) Dry(D), Chill(C), Frozen(F), Hazard(H)"
ans = selection_prompt("Print which category?  ")

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
header_hash = { FIITMN: 'FIITMN',
                ITEMD: 'ITEMD',
                FISZEI: 'FISZEI',
                FIPCKI: 'FIPCKI',
                PRICE: 'PRICE',
                CWCD: 'CWCD',
                RWCD: 'RWCD',
                BRAND: 'BRAND',
                FUPCU: 'FUPCU',
                FJVIN2: 'FJVIN2',
                DESC1: 'DESC1',
                FVNDN: 'FVNDN',
                FFJDCFF: 'FFJDCFF'}

items = []


itemsheet.parse(header_hash).each do |hash|
  item = Item.new(hash)
  if item.area == ans
    items << item
  elsif ans == "a"
    items << item unless item.num == 0 
  end
end

allitems = []
# items to each own array
items.each do |i|
  ary = []
  ary << i.num
  ary << i.num.parent.find_custom(custom).to_s.upcase
  ary << i.num.parent.find_custom2(custom).to_s.upcase
  ary << "#{i.pack} / #{zero_to_one(i.weight)} #{i.suffix}"
  ary << i.brand << i.upc << i.vin << i.sym
  # price conditional for CW
  if (i.cw == true) && (i.rw == false)
    ary << "$#{(cwtolb( i.suffix, i.weight ).to_f * i.pack).round(3) * i.price}"
  else
    ary << "$#{i.price}"
  end

  if i.rw == true
      ary << "PER #{i.suffix}"
  else
    ary << "UNIT"
  end


  if i.rw == true || i.comp_price.nil? || i.comp_price < 0.01
    ary << nil << nil
  elsif i.cw == true && i.rw == false
    ary << i.comp_price << "PER LB"
  else
    ary << i.comp_price << i.comp_unit
  end


  ary << i.vid



  allitems << ary
end



# tests #
########
puts "Created #{items.count} items just now"
puts "==" * 9



# export all items to csv #
##########################
CSV.open('data/tags_to_print.csv', "w", :row_sep => :auto) do |csv|
  csv << header
  allitems.each do |item|
    csv << item
  end
end
