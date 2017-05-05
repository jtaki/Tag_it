require_relative 'spec_helper'
include Comparative

describe Comparative do

  # before(:each) do
  #   Item.reset_all
  # end
  before do
    hsh = {
        :FITMN => "1234567",
        :ITEMD => "test product 1",
        :FISZEI => "3.25#",
        :FIPCKI => "60",
        :PRICE => "3.45",
        :CWCD => "N",
        :RWCD => "N",
        :BRAND => "some brand",
        :FUPCU => "0987654321",
        :FJVIN2 => "12345",
        :DESC1 => "&",
        :FVNDN => "12345"
      }
    @item = Item.new(hsh)
  end

  it "gets the comparative unit" do
    expect(get_comparative_units(@item)).to eq("PER LB")
  end

  it "creates comparative price" do
    expect(get_compared_price(@item)).to eq(3.45/(60 * 3.25))
  end


end
