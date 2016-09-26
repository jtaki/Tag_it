require 'roo-xls'

class Item
  attr_reader :line1, :line2, :description, :weight, :mod

  def initialize(name, weight)
    @description = clean_names(name)
    @line1  = separate_lines(@description)[0]
    @line2  = separate_lines(@description)[1]
    @weight = get_weight_num(weight)
    @mod    = get_weight_suffix(weight)
  end



private

  def clean_names(name)
    case name
    # #remove preceeding "EA " from string
    when /^(.|)EA\s/
      name.gsub(/^(.|)EA\s/,"").upcase
    else
      #remove unnecessary spaces to finalize
      name.strip.upcase
    end
  end

  def separate_lines(desc)
    desc = clean_names(desc)
    return desc.split(',').map{|x| x.strip.upcase}
  end

  def get_weight_num(weight)
    weight.gsub(/((-\d*{2})+\D*)|[^+(0-9)\.]/,"").to_f
  end

  def get_weight_suffix(x)
    case x
    when /\A[#]10/
      'CAN'
    when /[#]|LB(.*)/
      'LB'
    when /(O|)Z(.*)/
      'OZ'
    when /G(A|)L/
      'GAL'
    when /CT(.*)/
      'CT'
    when /BSKT(.*)/
      'BSKT'
    when /PK(.*)/
      'PK'
    when /EACH(.*)|EA(.*)/
      'EA'
    when /PINT(.*)|PT(.*)/
      'PT'
    when /PC(.*)/
      'PC'
    when /UP(.*)/
      # x or more pieces per lb
      'UP'
    when /KG(.*)/
      'KG'
    when /ML/
      'ML'
    when /BUNCH/
      'BUNCH'
    when /DZN/
      'DZN'
    when /GM(.*)/
      'GM'
    when /FT(.*)/
      'FT'
    when /QT(.*)/
      'QT'
    end

  end

end
