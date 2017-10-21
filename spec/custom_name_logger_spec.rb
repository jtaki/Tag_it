require 'custom_name_logger'

describe CustomNameLogger do
  let(:logger) { CustomNameLogger.new }

  it 'returns an array of custom names' do
    expect(logger.custom_names.class).to eq(Array)
  end

  it 'skips when primary name is empty' do

  end

  it 'can open a csv file' do

  end

end