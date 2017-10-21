require 'item'
require 'spec_helper'

describe Item do
  let(:item) { FactoryGirl.build(:item) }

  context 'pricing' do
    it 'sets correct price' do
      expect(item.price).to eq(50)
    end

    it 'gets comparative pricing' do
      expect(item.comp_price).to eq(0.05)
    end
  end

  context 'grammar' do
    it 'formats suffix' do
      expect(item.suffix).to eq('LB')
    end
  end

  context 'Information' do
    it 'can return parent number' do
      expect(item.parent).to eq(194764)
    end
  end
end