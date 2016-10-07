require_relative 'spec_helper'

def find_custom(col,num)
  custom = Roo::Spreadsheet.open('custom/logs/custom.xlsx')
  custom = custom.parse(num: 'ITEM', c1: 'Custom1', c2:'Custom2')
  #find the custom name value at line for col
  a = custom.select{|hash| hash[:num] == num }
  a = a.first
  return a[:c1]
end

describe Item do
  describe "custom names" do
    let(:item){41033}

    it "matches with and outputs correct name" do
      expect(find_custom(1, 41033)).to eq("SHIRES OF ENGLAND")
    end
  end
end
