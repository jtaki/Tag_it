require_relative 'spec_helper'

describe Description do

  before(:each) do
    Description.reset_all
  end

  let(:description) { Description.new("EA PICKLES, PEPPERED") }

  it "can initalize a description" do
    expect(description).to be_a(Description)
  end

  it "removes EA prefix" do
    expect(description.line1).to eq("PICKLES, PEPPERED")
    expect(description.line2).to eq("PICKLES, PEPPERED")
  end


end
