
module Comparative
  def get_comparative_units(item)
    if    item.rw     == true
      nil
    elsif item.suffix == "CAN"
      nil
    elsif (item.weight <=  1) && (item.pack <= 1)
      nil
    else
      "PER #{item.suffix}"
    end
  end

  def get_compared_price(item)
    suf = get_comparative_units(item)
    if item.cw == true
      item.price
    elsif suf != nil
      return item.price / (item.weight * item.pack)
    end
  end
end
