require 'yaml/store'

class Store
  attr_accessor :custom_names

  def initialize
    @custom_names = YAML::Store.new "custom_names.yml"
  end

end