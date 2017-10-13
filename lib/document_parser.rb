require 'roo-xls'
require_relative 'item'

# parses excel file into readable hash for runner
# Instantiates new items and adds them to itemlist object
# return the itemsheet object

class DocumentParser
  attr_accessor :itemsheet, :items

  def initialize(excel_file) #excel file will be a path
    @itemsheet = Roo::Spreadsheet.open(excel_file, csv_options: { encoding: Encoding::UTF_8 }, extension: :xls)
    @items = []
  end


  def parse_sheet
    itemsheet.parse(header_hash).each do |hash|
      item = Item.new(hash)
      @items << item unless item.num == 0
    end
  end

private


  def header
    [ "ItemNumber",
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
    "VenderID",
    "Slot"
  ]
  end

  def header_hash
    { num: 'FIITMN',
      description: 'ITEMD',
      size: 'FISZEI',
      pack: 'FIPCKI',
      price: 'PRICE',
      cw: 'CWCD',
      rw: 'RWCD',
      brand: 'BRAND',
      upc: 'FUPCU',
      vin: 'FJVIN2',
      sym: 'DESC1',
      vid: 'FVNDN',
      area: 'FFJDCFF',
      box_weight: 'FFJWTIW',
      slot: 'SLTN2'
  }
  end
end