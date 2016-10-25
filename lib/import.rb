require_relative 'item'
require 'roo-xls'

class ImportFile
  attr_reader :itemnums, :itemdesc

  def initialize(file)
    @itemnums = file.column(1)
    @itemdesc = file.column(6)
  end

end
