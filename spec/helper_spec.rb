require 'spec_helper'
include Helper

describe 'p/c helper methods' do
  before do
    @childnum  = 3123456
    @childnum2 = 3034567
  end

  it 'can tell if child' do
    expect(is_child(@childnum)).to eq(true)
  end

  it 'can generate a 6 dig parent from child' do
    num = @childnum.parent
    expect(num).to eq(123456)
  end


# for some reason, it also drops the 0 off ase well? ok that works
  it 'can generate 5 dig parent from child' do
    num = @childnum2.parent
    expect(num).to eq(34567)
  end

end
