require_relative 'item'
require 'roo-xls'
#
# itemsheet = Roo::Spreadsheet.open('data/vplbl3h9bent.xls')

# create new item from each line
class ImportFile
  attr_reader :itemnums, :itemdesc

  def initialize(file)
    @itemnums = file.column(1)
    @itemdesc = file.column(6)
  end
  # def get_item_array
  #   itemsheet = Roo::Spreadsheet.open('data/vplbl3h9bent.xls')
  #   itemNumbers = itemsheet.first_column
  # end

  #
  # 2.upto(itemsheet.last_row) do |line|
  #
  #   Item.new()
end
