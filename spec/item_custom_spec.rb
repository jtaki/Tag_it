require_relative 'spec_helper'

# def find_custom(num)
#   custom = Roo::Spreadsheet.open('custom/logs/custom.xlsx')
#   custom = custom.parse(num: 'ITEM', c1: 'Custom1', c2:'Custom2')
#   #find the custom name value at line for col
#   a = custom.select{|hash| hash[:num] == num }
#   a = a.first
#   return a[:c2]
# end

def find_custom
  custom = Roo::Spreadsheet.open('custom/output/custom2.csv', csv_options: {encoding: Encoding::ISO_8859_1})
  custom = custom.parse(num: 'ITEM', c1: 'Custom1', c2:'Custom2')
  #find the custom name value at line for col
  a = custom.select{|hash| hash[:num] == self.num }
  a = a.first
  puts a[:c1]
  return a[:c1]
end

describe Item do
  describe "custom names" do
    let(:item){3201069}

    it "matches with and outputs correct name" do
      expect(item.find_custom).to eq("PARIS TOASTS")
    end
  end

end
