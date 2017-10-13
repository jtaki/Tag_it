require 'document_parser'

describe DocumentParser do
  let(:excel_file) { "data/vplbl3h8c.xls" }
  let(:document) { DocumentParser.new(excel_file) }

  it 'can create a new DocumentParser object' do
    itemlist = document.itemsheet

    expect(itemlist.class).to eq(Roo::Excel)
  end

  context 'alignment' do
    before do
      document.parse_sheet
    end
    it 'correctly aligns header_hash' do
      first_item = document.items.first

      expect(first_item.num).to eq(3194764)
    end

  end
end