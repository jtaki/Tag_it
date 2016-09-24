require_relative 'spec_helper'

describe Item do

  before(:each) do
    Item.reset_all
  end

  let(:item) { Item.new("EA PICKLES, PEPPERED") }

  it "can initalize a item" do
    expect(item).to be_a(Item)
  end

  it "removes EA prefix" do
    expect(item.line1).to eq("PICKLES")
    expect(item.line2).to eq("PEPPERED")
  end


end
