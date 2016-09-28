require_relative 'tagit/item_helper'

class Item
  include Helper
  attr_reader :num, :line1, :line2, :weight, :suffix, :pack, :brand,
              :price, :upc, :vin, :sym, :cw, :rw, :child, :slot, :compare

  def initialize(num,nam,wei,pac,bra,pri,upc,vin,sym,cw,rw,slo = nil)
    @num    = num.to_i
    @description = clean_names(nam)
    @line1  = separate_lines(@description)[0]
    @line2  = separate_lines(@description)[1]
    @weight = get_weight_num(wei)
    @suffix = get_weight_suffix(wei)
    @pack   = pac.to_i
    @brand  = bra.strip
    @price  = clean_price(pri)
    @upc    = upc.to_s
    @vin    = vin.to_i
    @sym    = clean_text(sym)
    @cw     = rw == "Y" ? true : false
    @rw     = rw == "Y" ? true : false
    @child  = is_child(num)
    @slot   = slo

  end


private


 # unless it is a RW item, calculate comparative price

end
