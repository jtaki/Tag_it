# Takes excel custom names and instantiates into ymlstore
# or could create new from csv log
require 'store'
require 'csv'
# this is a process object
class CustomNameLogger

  def initialize
    store = Store.new
    @custom_names = []
  end

  # loads rename.csv data into yamlstore
  def load_new
    csv_file.map { |arr| arr.store_custom_into(store.custom_names) }
  end

  def store_custom_into(store)
    store.transaction do
      store[:data] = data
      store.abort unless
    end
  end

private

  def csv_file # returns array in array
    CSV.read('data/rename_these.csv', encoding: "UTF-8")
  end

  def remove_empty
  end

  def validate_names
  end

end