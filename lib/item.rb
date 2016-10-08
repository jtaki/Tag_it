require_relative 'tagit/item_helper'
require_relative 'tagit/comparative_price'

class Item
  include Helper
  include Comparative

  attr_accessor :num, :line1, :line2, :weight, :suffix, :pack, :brand,
              :price, :cw, :rw, :child, :slot, :compare,
              :comp_unit, :comp_price, :upc, :vin, :sym

  def initialize(num,nam,wei,pac,pri,cw,rw,brand,upc,vin,symn,slot)
    @num    = num.to_i
    @description = clean_names(nam)
    @weight = get_weight_num(wei)
    @suffix = get_weight_suffix(wei)
    @pack   = pac.to_i
    @price  = pri.to_f
    @cw     = rw == "Y" ? true : false
    @rw     = rw == "Y" ? true : false
    @comp_unit  = get_comparative_units(self)
    @comp_price = get_compared_price(self)
    # @line1  = find_custom(1,self.num)
    # @line2  = find_custom(2,self.num)
  end


  #returns array of matched custom names
  # [custom 1 , custom 2]
  def find_custom(file)
    #find the custom name value at line for col
    file.each do |hsh|
      if hsh[:num].is_a?(String)
        hsh[:num] = hsh[:num].to_i
      else
        next
      end
    end

    a = file.select{|hash| hash[:num] == self.num }
    a = a.first
    # puts a[:c1]
    return a[:c1]
  end

  def find_custom2(file)
    #find the custom name value at line for col
    file.each do |hsh|
      if hsh[:num].is_a?(String)
        hsh[:num] = hsh[:num].to_i
      else
        next
      end
    end

    a = file.select{|hash| hash[:num] == self.num }
    a = a.first
    # puts a[:c1]
    return a[:c2]
  end

   # unless it is a RW item, calculate comparative price

end
