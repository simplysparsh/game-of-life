require 'rspec'
require 'cell.rb'

describe 'Cell'  do

  describe '#get_status' do

    context 'when the cell is alive' do
      let(:cell) { Cell.new(:alive) }

      it 'dies if it has less than two live neighbours' do
        expect(cell.get_status).to eq(:dead)
      end

      it 'dies if it has more than three live neighbours'


      it 'continues to live if it has two or three live neighbours'
    end

    context 'when the cell is dead' do
      it 'comes to life if it has exactly three neighbours'
    end

  end
  
end