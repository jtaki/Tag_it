require 'name_database'

describe NameDatabase do
  let(:db) { NameDatabase.new('test_database.yml') }
  let(:name_array) { [11111,"test", "test"] }

  it 'can persist information into the yml file' do
    db.append_new(name_array)

    expect()
  end

  xit 'can retrieve specific name by number' do
  end

  it 'creates a new item struct' do
    item = NameDatabase::Item.new(1111,"test","test")
    expect(item).to be_a(Struct)
  end

  it 'can retrieve information from the yml file' do
    db.load_data

    expect(db.items.has_key?(12345)).to eq(true)
  end

end