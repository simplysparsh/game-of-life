require 'rspec'
require 'cell'

describe 'Cell' do

  describe '#is_alive?' do
    let(:cell) { Cell.new(10, :alive) }

    it 'returns true when the cell is alive' do
      expect(cell.is_alive?).to be(true)
    end
  end

  describe '#is_dead?' do
    let(:cell) { Cell.new(10) }

    it 'returns true when the cell is alive' do
      expect(cell.is_dead?).to be(true)
    end
  end

  describe '#revive' do
    let(:cell) { Cell.new(10) }

    it 'changes the cell status to alive' do
      cell.revive
      expect(cell.status).to eq(:alive)
    end
  end

  describe '#kill' do
    let(:cell) { Cell.new(10, :alive) }

    it 'changes the cell status to dead' do
      cell.kill
      expect(cell.status).to eq(:dead)
    end
  end

end