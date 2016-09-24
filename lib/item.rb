class Item
  attr_reader :line1, :line2, :description

  @@itemlist = []

  def initialize(name)
    @description = clean_names(name)
    @line1 = separate_lines(@description)[0]
    @line2 = separate_lines(@description)[1]
    @@itemlist << self
  end

  def self.reset_all
    @@itemlist.clear
  end

private

  def clean_names(desc)
    case desc
    # #remove preceeding "EA " from string
    when /^(.|)EA\s/
      desc = desc.gsub(/^(.|)EA\s/,"").upcase
    else
      #remove unnecessary spaces to finalize
      desc = desc.strip.upcase
    end
  end


  def separate_lines(desc)
    desc = clean_names(desc)
    return desc.split(',').map{|x| x.strip.upcase}
  end


end
