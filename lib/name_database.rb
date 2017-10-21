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
      @store.fetch('data', "key does not exist")
    end
  end

  def find_by_number(number) # returns item struct
    key = number
    @items.fetch(number, "item does not exist")
  end
  # accepts an array of arrays
  # needs to append to load_data
  def append_new_item(arr)
    item = Item.new(*arr)
    update_database(item, 'item.number')
  end

  private

  def update_database(item, keyname)
    @store.transaction do
      @store['data'][keyname] = item
      @store.commit
    end
  end

end