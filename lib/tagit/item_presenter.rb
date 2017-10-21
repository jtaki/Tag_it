require_relative 'comparative_price'

# Presentation layer helper
module ItemPresenter
include Comparative

  def description_1(item); end
  def description_2(item); end
  def weight
    get_weight_num self.size
  end
  def suffix
    get_weight_suffix(self.size)
  end
  def comp_price
    get_compared_price self
  end
  def comp_unit
    get_compared_units self
  end
  # def child(item); end
  def parent
    is_child?(self) ? num.to_s.split('').drop(1).join.to_i : num
  end

  private

  def is_child?(item)
    item.num.to_s.match(/^(3\d{6}$|30\d{5}$)/) ? true : false
  end

  def find_custom(file)
    # takes parsed roo object
    # should return array or hash
    #find the custom name value at line for col
    custom_name = []
    file.each do |hsh|
      hsh[:num] = hsh[:num].to_i if hsh[:num].is_a?(String)
    end

    a = file.select{|hash| hash[:num] == self }
    a = a.first
    custom_name << a[:c1] << a[:c2]
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
    when /FT(.*)|'/
      'FT'
    when /QT(.*)/
      'QT'
    when /HG(.*)/
      'HG'
    when /RL(.*)/
      'RL'
    when /LT(.*)/
      'L'

    # when /(?<suffix>[a-zA-Z]{2,3})/ =~ x
    #   suffix
    end
  end

  def zero_to_one num
  num == 0 ? 1 : num
  end

  def separate_lines(desc)
    desc = clean_names(desc)
    return desc.split(',').map{|x| x.strip.upcase}
  end

  def get_weight_num(weight)
    if weight.include? "1/2"
      num = weight.scan(/\d{1,}\.?\d{0,2}/).map(&:to_f).inject(1,:/)
      #regex for 1 or more digits, allow for "." and 0-2 digits
      return zero_to_one num
    elsif weight.include? "/"
      num = weight.scan(/\d{1,}\.?\d{0,2}/).map(&:to_f).inject(1,:*)
      # assuming that 1/2 is used as .5 and all other is a pack-of(multiply)
      return zero_to_one num
    elsif weight.include? "-"
      num = weight.scan(/\d{1,}\.?\d{0,2}/).map(&:to_f).inject(:+).fdiv(2)
      # for range, returns average.
      return zero_to_one num
    else
      num = weight.gsub(/((-\d*{2})+\D*)|[^+(0-9)\.]/,"").to_f
      return zero_to_one num
    end
  end

  def clean_names(item)
    name = item.name
    case name
    # #remove preceeding "EA " from string
    when /^(.|)EA\s/
      name.gsub(/^(.|)EA\s/,"").upcase
    else
      #remove unnecessary spaces to finalize
      name.strip.upcase
    end
  end

  def cwtolb(suf,wt)
    case suf
    when 'LB'
      1 * wt
    when 'GM'
      0.00220462 * wt
    when 'OZ'
      0.0625 * wt
    when 'KG'
      2.20462 * wt
    end
  end

end
