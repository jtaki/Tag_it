require_relative 'tagit/item_helper'
require_relative 'tagit/comparative_price'

class Item
  include Helper
  include Comparative

  attr_accessor :num, :line1, :line2, :weight, :suffix, :pack, :brand,
              :price, :cw, :rw, :child, :compare,
              :comp_unit, :comp_price, :upc, :vin, :sym, :vid, :area, :box_weight

  def initialize(hsh)
    @num    = hsh[:FIITMN].to_i
    @description = clean_names(hsh[:ITEMD])
    @weight = get_weight_num(hsh[:FISZEI])
    @suffix = get_weight_suffix(hsh[:FISZEI])
    @pack   = hsh[:FIPCKI].to_i
    @price  = hsh[:PRICE].to_f
    @cw     = hsh[:CWCD] == "Y" ? (true) : (false)
    @rw     = hsh[:RWCD] == "Y" ? (true) : check_for_exception_rw(self.num)
    @comp_unit  = get_comparative_units(self)
    @comp_price = get_compared_price(self)
    @brand = hsh[:BRAND].to_s.strip
    @upc = hsh[:FUPCU].to_s.strip
    @vin = hsh[:FJVIN2].to_s.strip
    @sym = hsh[:DESC1].to_s.strip
    @vid = hsh[:FVNDN].to_i
    @area = hsh[:FFJDCFF].downcase
    @box_weight = hsh[:FFJWTIW].to_f
  end

end
