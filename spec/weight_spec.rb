require_relative 'spec_helper'

describe Item do

  # before(:each) do
  #   Item.reset_all
  # end

  let(:item) { Item.new("NAME", "50# AVG")}

  it "weight as integer or range as string" do
    expect(item.weight).to eq(50)
  end

  it "has a specific modifier" do
    expect(item.mod).to eq("LB")
  end

end
