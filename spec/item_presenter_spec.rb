require 'spec_helper'
require 'item_presenter'
require 'item'

describe ItemPresenter do
  let(:item) { FactoryGirl.build(:item) }
  let(:item_1) { FactoryGirl.build(:item, :child_item_1) }
  let(:item_2) { FactoryGirl.build(:item, :child_item_2) }

  it 'can tell if parent' do
    expect(item.parent?).to eq(true)
  end

  it 'can generate a 6 dig parent from child' do
    num = item_2.parent
    digits = num.to_s.length

    expect(digits).to eq(6)
  end


# for some reason, it also drops the 0 off ase well? ok that works
  it 'can generate 5 dig parent from child' do
    num = item_1.parent
    digits = num.to_s.length

    expect(digits).to eq(5)
  end

end


describe 'item with fractional' do
  let(:frac_item) { FactoryGirl.build(:item, :fractional_weight_item) }


  it 'changes pound sign to lettering'do
    expect(frac_item.suffix).to eq('LB')
  end

  it 'works with fractional numbers' do
    expect(frac_item.weight).to eq(11)
  end

end

describe 'item with apostrophe for FT' do
  let(:item) { FactoryGirl.build(:item, :apostrophe_weight) }

  it 'changes pound sign to lettering'do
    expect(item.suffix).to eq('FT')
  end

end

describe 'item with range' do
  let(:item) { FactoryGirl.build(:item, :range_weight) }

  it 'works with fractional numbers' do
    expect(item.weight).to eq(3.5)
  end

end


# test the au jus thing that didnt work giving lower price by about a dollar

# describe 'ounces to pounds' do

#     let(:item) { Item.new({
#             :FIITMN => "112554",
#             :ITEMD => " BEEF, PATTY AU JUS SEASONED HOMESTYLE",
#             :FISZEI => "5.3OZ",
#             :FIPCKI => "1",
#             :PRICE => "3.62",
#             :CWCD => "Y",
#             :RWCD => "N",
#             :BRAND => "TNT BURGER",
#             :FUPCU => "0987654321",
#             :FJVIN2 => "12345",
#             :DESC1 => "&",
#             :FVNDN => "12345"
#           })}


#   it 'gets correct weight' do
#     expect(item.weight).to eq(5.3)
#   end

#   it 'turns oz to pounds correctly' do
#     expect(cwtolb(item.suffix, item.weight)).to eq(0.33125)
#   end

#   it 'rounds weight to case' do
#     expect
#   end

# end