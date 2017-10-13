require_relative 'tagit/item_presenter'

class Item
  include ItemPresenter

  attr_accessor :num, :pack, :brand,
              :price, :cw, :rw, :child,
              :upc, :vin, :sym, :vid, :area, :box_weight, :slot,
              :description, :size

  def initialize(hsh)
    @num    = hsh[:num].to_i
    @description = hsh[:description]
    @size = hsh[:size].to_s
    @pack   = hsh[:pack].to_i
    @price  = hsh[:price].to_f
    @cw     = hsh[:cw] == "Y" ? (true) : (false)
    @rw     = hsh[:rw] == "Y" ? (true) : (false) # todo: exceptions for errors
    @brand = hsh[:brand].to_s.strip
    @upc = hsh[:upc].to_s.strip
    @vin = hsh[:vin].to_s.strip
    @sym = hsh[:sym].to_s.strip
    @vid = hsh[:vid].to_i
    @area = hsh[:area].to_s.downcase
    @box_weight = hsh[:box_weight].to_f
    @slot = hsh[:slot]
  end
end
