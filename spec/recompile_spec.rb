require_relative 'spec_helper'

describe Custom do

  file = 'custom/output/rename_these.csv'
  let(:sheet) {Roo::Spreadsheet.open(file)}

  it "is an array" do
    expect(sheet).is_a?(Array)
  end

  xit "has two columns" do

  end



end
