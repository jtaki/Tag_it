class Description
  attr_reader :line1, :line2

  @@descriptions = []

  def initialize(input)
    @line1 = clean_names(input)
    @line2 = clean_names(input)
    @@descriptions << self
  end

  def self.reset_all
    @@descriptions.clear
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

end
