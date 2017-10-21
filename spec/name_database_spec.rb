require 'name_database'

describe NameDatabase do
  let(:db) { NameDatabase.new('test_database.yml') }
  let(:name_array) { [11111,"test", "test"] }

  context 'information reduction' do

    it 'can persist information into the yml file' do
      db.append_new_item(name_array)
      db.load_data

      expect(db.items).to include(name_array[0])
    end

    it 'can retrieve information from the yml file' do
      db.load_data

      expect(db.items.has_key?(12345)).to eq(true)
    end

  end

  it 'can retrieve specific name by number' do
    db.load_data
    num = name_array[0]
    item_lookup = db.find_by_number(num)

    expect(item_lookup[:number]).to eq(num)
  end

  it 'creates a new item struct' do
    item = NameDatabase::Item.new(1111,"test","test")
    expect(item).to be_a(Struct)
  end

end