require_relative 'spec_helper'


describe Item do
  describe "custom names" do
    before do
      @custom = Roo::Spreadsheet.open('custom/logs/custom.csv', csv_options: {encoding: Encoding::ISO_8859_1})
      @custom = @custom.parse(num: 'ITEM', c1: 'Custom1', c2:'Custom2')
      @item = Item.new(3231034,"ASDF","1 LB",2,1,"N","N","test",123,123,"$","123")
    end


    # it "matches with and outputs correct name" do
    #   expect(@item.find_custom(@custom)).to eq("BEAN THREAD NOODLES")
    # end

    it "matches with and outputs parent name" do
      expect(@item.find_custom(@custom)).to eq("BEAN THREAD NOODLES")
    end


  end

end
