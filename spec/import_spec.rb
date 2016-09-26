require_relative 'spec_helper'
require 'roo-xls'

itemsheet = Roo::Spreadsheet.open('data/vplbl3h9bent.xls')


describe ImportFile do

  let(:sheet) {ImportFile.new(itemsheet)}

  it 'has item number Array' do
    expect(sheet.itemnums.class).to eq(Array)
  end

  it 'imports all rows' do
    expect(sheet.itemnums.count).to eq(342)
  end

end
