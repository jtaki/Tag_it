require 'yaml/store'
require 'yaml'
require 'ostruct'

class NameDatabase

  Item = Struct.new(:number, :desc_1, :desc_2)

  attr_accessor :store, :items

  def initialize(db = "names_database.yml")
    @store = YAML::Store.new db
  end

  def load_data
    @items = @store.transaction do
      @store.fetch(:data, "key does not exist")
    end
    puts @items
  end

  def find_by_number(number)
    key = number.to_sym
  end
  # accepts an array of arrays
  # needs to append to load_data
  def append_new(new_items_array)
    new_items_array.each do |i|
      item = ::Item.new(i[1], i[2], i[3])
      if check_duplicate?(item[:number])
        update_database(item)
      end
    end
  end

  private

  def update_database(item)
    @store.transaction do
      # unless the key (itemnum) already exists, then store it
      @items += item
      @store[:data] = @items
      @store.commit
    end
  end

  def check_duplicate?(itemnum)
    # checks number against yaml keys , returns true if nomatch
    true
  end

end