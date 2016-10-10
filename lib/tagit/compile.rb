require 'roo'

module Compiler
  #start open rename_these and custom.xlsx
  def compiler

    custom_new = Roo::Spreadsheet.open('custom/output/rename_these.csv')
    custom_main = Roo::Spreadsheet.open('custom/logs/custom.csv',csv_options: {encoding: Encoding::ISO_8859_1})

    unless custom_new.count <= 1
      # parse main
      custom_main = custom_main.parse(num: 'ITEM', c1: 'Custom1', c2: 'Custom2' )
      # a = custom_main.count
      custom_new = custom_new.each(num: 'ITEM', c1: 'Custom1', c2: 'Custom2' ) do |hash|
        unless hash[:num] == "ITEM"
          custom_main << hash
        end
      end
    end

    CSV.open('custom/logs/custom.csv','w') do |csv|
      custom_main.each do |item|
        csv << item.values
      end
    end
  end
end

include Compiler
compiler
