require_relative 'comparative_price'

# Presentation layer helper
module ItemPresenter
include ComparativePrice

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
    if is_child?(self)
      arr = num.to_s.split('')
      if arr[1] == 0 && arr.length == 6
        arr.drop(2).join.to_i
      else
        arr.drop(1).join.to_i
      end
    else
      num
    end
  end

  def parent?
    !is_child?(self)
  end

  def child?
    is_child?(self)
  end

  private

  def is_child?(item)
    item.num.to_s.match(/^(30?\d{5,6})/) ? true : false
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

  def get_weight_suffix(weight)
    case
    when weight.match(/\A[#]10/)
      'CAN'
    when weight.match(/[#]|LB(.*)/)
      'LB'
    when weight.match(/(O|)Z(.*)/)
      'OZ'
    when weight.match(/G(A|)L/)
      'GAL'
    when weight.match(/CT(.*)/)
      'CT'
    when weight.match(/BSKT(.*)/)
      'BSKT'
    when weight.match(/PK(.*)/)
      'PK'
    when weight.match(/EACH(.*)|EA(.*)/)
      'EA'
    when weight.match(/PINT(.*)|PT(.*)/)
      'PT'
    when weight.match(/PC(.*)/)
      'PC'
    when weight.match(/UP(.*)/)
      # x or more pieces per lb
      'UP'
    when weight.match(/KG(.*)/)
      'KG'
    when weight.match(/ML/)
      'ML'
    when weight.match(/BUNCH/)
      'BUNCH'
    when weight.match(/DZN/)
      'DZN'
    when weight.match(/GM(.*)/)
      'GM'
    when weight.match(/FT(.*)|'/)
      'FT'
    when weight.match(/QT(.*)/)
      'QT'
    when weight.match(/HG(.*)/)
      'HG'
    when weight.match(/RL(.*)/)
      'RL'
    when weight.match(/LT(.*)/)
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
