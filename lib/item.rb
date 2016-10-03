require_relative 'tagit/item_helper'
require_relative 'tagit/comparative_price'

class Item
  include Helper
  include Comparative

  attr_reader :num, :line1, :line2, :weight, :suffix, :pack, :brand,
              :price, :upc, :vin, :sym, :cw, :rw, :child, :slot, :compare,
              :comp_unit, :comp_price

  def initialize(num,nam,wei,pac,bra,pri,upc,vin,sym,cw,rw,slo = nil)
    @num    = num.to_i
    @description = clean_names(nam)
    @line1  = separate_lines(@description)[0]
    @line2  = separate_lines(@description)[1]
    @weight = get_weight_num(wei)
    @suffix = get_weight_suffix(wei)
    @pack   = pac.to_i
    @brand  = bra.strip
    @price  = pri.to_f
    @upc    = upc.to_s
    @vin    = vin.to_i
    @sym    = clean_text(sym)
    @cw     = rw == "Y" ? true : false
    @rw     = rw == "Y" ? true : false
    @child  = is_child(num)
    @slot   = slo
    @comp_unit  = get_comparative_units(self)
    @comp_price = get_compared_price(self)

  end


private


 # unless it is a RW item, calculate comparative price

end
