module Comparative
  def get_comparative_units(Item)
    case measurement
    when /OZ\z/
      nil
    when /LB\z/
      self.covert_to(:oz)
    end
  end

  def

end
