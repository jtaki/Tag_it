require_relative 'spec_helper'
include Helper


describe Item do
  describe "custom names" do
    before do
      @custom = Roo::Spreadsheet.open('custom/logs/custom.csv', csv_options: {encoding: Encoding::ISO_8859_1})
      @custom = @custom.parse(num: 'ITEM', c1: 'Custom1', c2:'Custom2')
    end

    describe 'children numbers' do
      before do
        @item = Item.new(3231034,"ASDF","1 LB",2,1,"N","N","test",123,123,"$","123")
      end

      it 'item is a child' do
        expect(is_child(@item.num)).to eq(true)
      end

      it 'can get parent number' do
        expect(@item.num.parent).to eq(231034)
      end

      it "matches with and outputs parent name" do
        expect(@item.num.parent.find_custom(@custom)).to eq("BEAN THREAD NOODLES")
      end

      it 'returns nil for empty 2nd custom' do
        expect(@item.num.parent.find_custom2(@custom)).to eq(nil)
      end
    end

    describe 'parent numbers' do
      before do
        @item = Item.new(231034,"ASDF","1 LB",2,1,"N","N","test",123,123,"$","123")
        @item2 = Item.new(41343,"ASDF","1 LB",2,1,"N","N","test",123,123,"$","123")
      end

      it 'reutrns self' do
        expect(@item.num.parent).to eq(231034)
        expect(@item2.num.parent).to eq(41343)
      end

    end

  end
end
