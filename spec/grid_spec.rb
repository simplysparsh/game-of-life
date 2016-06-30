require 'rspec'
require 'world.rb'

describe 'Grid'  do

  let(:grid) { Grid.new }
  let(:cells) { grid.cells }

  describe '#set_initial_live_cells' do

    it 'sets the status of the cells, on the given positions, to alive' do
      cell_positions = [94]
      grid.set_initial_live_cells(cell_positions)

      expect(cells[94].status).to eq(:alive)
    end
  end

  describe '#get_live_neighbours' do
    it 'returns an array of live neighbours for the given cell' do
      cell_positions = [34, 46]
      grid.set_initial_live_cells(cell_positions)

      expect(grid.get_live_neighbours(cells[45])).to contain_exactly(cells[34], cells[46])
    end
  end

end


