require_relative 'spec_helper'

describe Item do

  # before(:each) do
  #   Item.reset_all
  # end

  let(:item) { Item.new("EA PICKLES, PEPPERED") }

  it "can initalize" do
    expect(item).to be_a(Item)
  end

  it "removes EA prefix" do
    expect(item.description).to eq("PICKLES, PEPPERED")
  end


  it "separates 2 lines" do
    expect(item.line1).to eq("PICKLES")
    expect(item.line2).to eq("PEPPERED")
  end


end
