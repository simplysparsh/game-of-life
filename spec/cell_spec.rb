require 'rspec'
require 'cell'

describe 'Cell' do

  describe '#switch_status' do

    context 'when the cell is alive' do
      let(:cell) { Cell.new(10, :alive) }

      it 'changes the cell status to dead' do
        cell.switch_status
        expect(cell.status).to eq(:dead)
      end
    end

    context 'when the cell is dead' do
      let(:cell) { Cell.new(10, :dead) }

      it 'changes the cell status to alive' do
        cell.switch_status
        expect(cell.status).to eq(:alive)
      end
    end

  end

  describe '#is_alive?' do
    let(:cell) { Cell.new(10, :alive) }

    it 'returns true when the cell is alive' do
      expect(cell.is_alive?).to be(true)
    end
  end

end