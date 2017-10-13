class Io
  attr_reader :instream :outstream

  def initialize(instream, outstream)
    @instream = instream
    @outstream = outstream
  end

  # Add any IO prompts & messages here
  def created_summary(num)
    outstream.puts "Created #{num} items just now"
  end

  def prompt_rename_items
    outstream.puts "Please rename items in 'rename.csv' and run this program again..."
  end

end