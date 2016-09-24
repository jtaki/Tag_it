class Item
  attr_reader :line1, :line2, :description, :weight

  def initialize(name, weight)
    @description = clean_names(name)
    @line1  = separate_lines(@description)[0]
    @line2  = separate_lines(@description)[1]
    @weight = get_weight_num(weight)
    # @mod    =
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


end
