require 'name_logger'

describe NameLogger do
  # initialize the database & .load_data
  # loads arrays and
  # get array of items that do not exist in database
  # feeds them into database.
  let(:name_process) { NameLogger.new }
  let(:name_db) { name_process.store }
end