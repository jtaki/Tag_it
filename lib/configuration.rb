class Configuration

  def initialize
    @io = Io.new($stdin, $stout)
  end

end