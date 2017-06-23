require 'spec_helper'
include Helper

describe 'parent child helper methods' do
  before do
    @childnum  = 3123456
    @childnum2 = 3034567
  end

  it 'can tell if child' do
    expect(is_child(@childnum)).to eq(true)
  end

  it 'can generate a 6 dig parent from child' do
    num = @childnum.parent
    expect(num).to eq(123456)
  end


# for some reason, it also drops the 0 off ase well? ok that works
  it 'can generate 5 dig parent from child' do
    num = @childnum2.parent
    expect(num).to eq(34567)
  end

end


describe 'item with fractional' do

    let(:item) { Item.new({
            :FIITMN => "1234567",
            :ITEMD => "test product 1",
            :FISZEI => "5/2.2#",
            :FIPCKI => "1",
            :PRICE => "3.45",
            :CWCD => "N",
            :RWCD => "N",
            :BRAND => "some brand",
            :FUPCU => "0987654321",
            :FJVIN2 => "12345",
            :DESC1 => "&",
            :FVNDN => "12345"
          })}

  it 'changes pound sign to lettering'do
    expect(item.suffix).to eq('LB')
  end

  it 'works with fractional numbers' do
    expect(item.weight).to eq(11)
  end

end

describe 'item with apostrophe for FT' do

    let(:item) { Item.new({
            :FIITMN => "1234567",
            :ITEMD => "test product 1",
            :FISZEI => "5'",
            :FIPCKI => "1",
            :PRICE => "3.45",
            :CWCD => "N",
            :RWCD => "N",
            :BRAND => "some brand",
            :FUPCU => "0987654321",
            :FJVIN2 => "12345",
            :DESC1 => "&",
            :FVNDN => "12345"
          })}

  it 'changes pound sign to lettering'do
    expect(item.suffix).to eq('FT')
  end

end

describe 'item with fractional' do

    let(:item) { Item.new({
            :FIITMN => "1234567",
            :ITEMD => "test product 1",
            :FISZEI => "1/2#",
            :FIPCKI => "1",
            :PRICE => "3.45",
            :CWCD => "N",
            :RWCD => "N",
            :BRAND => "some brand",
            :FUPCU => "0987654321",
            :FJVIN2 => "12345",
            :DESC1 => "&",
            :FVNDN => "12345"
          })}

  it 'changes pound sign to lettering'do
    expect(item.suffix).to eq('LB')
  end

  it 'works with fractional numbers' do
    expect(item.weight).to eq(0.5)
  end

end

describe 'item with range' do

    let(:item) { Item.new({
            :FIITMN => "1234567",
            :ITEMD => "test product 1",
            :FISZEI => "3-4#",
            :FIPCKI => "1",
            :PRICE => "3.45",
            :CWCD => "N",
            :RWCD => "N",
            :BRAND => "some brand",
            :FUPCU => "0987654321",
            :FJVIN2 => "12345",
            :DESC1 => "&",
            :FVNDN => "12345"
          })}


  it 'works with fractional numbers' do
    expect(item.weight).to eq(3.5)
  end

end


# test the au jus thing that didnt work giving lower price by about a dollar

describe 'item with range' do

    let(:item) { Item.new({
            :FIITMN => "112554",
            :ITEMD => " BEEF, PATTY AU JUS SEASONED HOMESTYLE",
            :FISZEI => "5.3OZ",
            :FIPCKI => "1",
            :PRICE => "3.62",
            :CWCD => "Y",
            :RWCD => "N",
            :BRAND => "TNT BURGER",
            :FUPCU => "0987654321",
            :FJVIN2 => "12345",
            :DESC1 => "&",
            :FVNDN => "12345"
          })}


  it 'gets correct weight' do
    expect(item.weight).to eq(5.3)
  end

  it 'turns oz to pounds correctly' do
    expect(cwtolb(item.suffix, item.weight)).to eq(0.33125)
  end

  it 'rounds weight to case' do
    expect
  end

end


# exception item
describe 'handles item with rw exception' do

    let(:item) { Item.new({
            :FIITMN => "3194114",
            :ITEMD => "SALMON FILLET",
            :FISZEI => "3.5LB",
            :FIPCKI => "1",
            :PRICE => "8.44",
            :CWCD => "Y",
            :RWCD => "N",
            :BRAND => "PACKER",
            :FUPCU => "987654321",
            :FJVIN2 => "12345",
            :DESC1 => "&",
            :FVNDN => "12345"
          })}

  it 'treats as random weight' do
    expect(item.rw).to  be_truthy
  end

end
