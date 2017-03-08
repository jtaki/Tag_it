module Helper

  def is_child(num)
    num.to_s.match(/^(3\d{6}$|30\d{5}$)/) ? true : false
  end

  #call on item number
  def parent
    if is_child(self)
      self.to_s.split('').drop(1).join.to_i
    else
      self
    end
  end

  def find_custom(file)
    #find the custom name value at line for col
    file.each do |hsh|
      hsh[:num] = hsh[:num].to_i if hsh[:num].is_a?(String)
    end

    a = file.select{|hash| hash[:num] == self }
    a = a.first
    return a[:c1]
  end

  def find_custom2(file)
    #find the custom name value at line for col
    file.each do |hsh|
      hsh[:num] = hsh[:num].to_i if hsh[:num].is_a?(String)
    end

    a = file.select{|hash| hash[:num] == self }
    a = a.first
    return a[:c2]
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
    if weight.include? "/"
      weight.scan(/\d{1,}/).map(&:to_i).reduce(:*)
    else
      weight.gsub(/((-\d*{2})+\D*)|[^+(0-9)\.]/,"").to_f
    end
  end

  def clean_text(text)
    text.to_s.strip
  end

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
