require 'roo'

  #start open rename_these and custom.xlsx
  custom_new = Roo::Spreadsheet.open('custom/output/rename_these.csv')
  custom_main = Roo::Spreadsheet.open('custom/logs/custom.xlsx')

  # parse main
  custom_main = custom_main.parse(num: 'ITEM', c1: 'Custom1', c2: 'Custom2' )
  # a = custom_main.count
  custom_new = custom_new.each(num: 'ITEM', c1: 'Custom1', c2: 'Custom2' ) do |hash|
    custom_main << hash
  end

  CSV.open('custom/output/custom2.csv','w') do |csv|
    custom_main.each do |item|
      csv << item.values
    end
  end
