# Takes excel custom names and cleans them up for ymlstore
# middlelayer between namedatabase
# or could create new from csv log

require 'name_data_base'
require 'csv'
# this is a process object
class NameLogger

  def initialize
    database = NameDatabase.new
    store = database.store
    @custom_names = []
  end

  # loads rename.csv data into yamlstore
  def load_csv_edits
    new_edits_array.map { |arr|  }
  end

  def store_custom_into(store)
  end

private

  def new_edits_array # returns array in array
    CSV.read('data/rename_these.csv', encoding: "UTF-8")
  end

  def remove_empty
    new_edits_array.each do |arr|
      unless arr[2] == "" | nil
        custom_names << arr
      end
    end
  end

  def validate_names
  end

end