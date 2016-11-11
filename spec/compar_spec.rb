require_relative 'spec_helper'

describe Comparative do

  # before(:each) do
  #   Item.reset_all
  # end
  let(:item) { Item.new(
      num: 1234567,
      nam: "test product 1",
      wei: "3.25#",
      pac: "60",
      pri: 3.45,
      cw: "N",
      rw: "N",
      brand: "some brand",
      upc: "0987654321",
      vin: "12345",
      sym: "&",
      vid: "12345"

    )}

  it "gets the comparative unit" do
    expect(get_comparative_units(item)).to eq("LB")
  end

  it "creates comparative price" do
    expect(get_compared_price(item)).to eq(3.25/60)
  end

end
