require_relative 'spec_helper'

describe Comparative do

  # before(:each) do
  #   Item.reset_all
  # end
  let(:item) { Item.new( )}

  it "gets the comparative unit" do
    expect(get_comparative_units(item)).to eq("LB")
  end

  it "creates comparative price" do
    expect(get_compared_price(item)).to eq(3.25/60)
  end

end
