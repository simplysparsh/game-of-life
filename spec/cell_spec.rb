require 'rspec'
require 'cell'

describe 'Cell' do

  cell_1 = Cell.new(4,5)
  cell_2 = Cell.new(8,9)

  it 'has x coordinate' do
    expect(cell_1.x).to eq(4)
  end

  it 'has y coordinate' do
    expect(cell_1.y).to eq(5)
  end

  describe '#is_equal?' do
    it 'compares the cell for equality' do
      expect(cell_2.is_equal?(cell_1)).to be false
      expect(cell_1.is_equal?(cell_1)).to be true
    end
  end

end