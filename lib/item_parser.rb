#!/usr/bin/env rubygems
require_relative 'item'
require_relative './tagit/compile'
require_relative 'custon_name_logger'

include Helper
include Compiler

compiler

itemlist = DocumentParser.new('data/vplbl3h8c.xls')
items = itemlist.parse_sheet

# Run generator
namelog = CustomNameLogger.new
namelog.load_new

# custom = Roo::Spreadsheet.open('custom/logs/custom.csv', csv_options: {encoding: Encoding::ISO_8859_1})
custom = custom.parse(num: 'ITEM', c1: 'Custom1', c2:'Custom2')

allitems       = []
frozen_items   = []
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
    ary << "$#{ i.box_weight.round(1) * i.price }"
  else
    ary << "$#{i.price}"
  end

  if i.rw
      ary << "PER LB"
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


  ary << i.vid << i.slot


  if i.area == "f"
    frozen_items << ary
  else
    allitems << ary
  end
end



# output #
########
puts "Created #{items.count} items just now"
puts "==" * 9
sleep(3)



# export all items to csv #
##########################
CSV.open('data/tags_to_print.csv', "w", :row_sep => :auto) do |csv|
  csv << header
  allitems.each do |item|
    csv << item
  end
end

CSV.open('data/frozen_to_print.csv', "w", :row_sep => :auto) do |csv|
  csv << header
  frozen_items.each do |item|
    csv << item
  end
end
