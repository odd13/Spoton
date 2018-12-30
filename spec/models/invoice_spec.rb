require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe '#parent & #children' do
    it 'should be able to do parent tree' do
      i1 = Invoice.create()
      i2 = Invoice.create(parent: i1)

      expect(i1.children).to eq(i2)
      expect(i2.parent).to eq(i1)
    end
  end
end
