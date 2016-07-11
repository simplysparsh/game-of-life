require 'rspec'
require 'world.rb'

describe 'Grid'  do

  let(:grid) { Grid.new(10) }

  describe '#set_initial_live_cells' do

    it 'sets the status of the cells, on the given positions, to alive' do
      cells_to_revive = [grid.cell(4,9), grid.cell(4,3)]
      grid.set_initial_live_cells(cells_to_revive)

      expect(grid.cell(4,9).status).to eq(:alive)
      expect(grid.cell(4,3).status).to eq(:alive)
    end
  end

  describe '#get_live_neighbours' do
    it 'returns an array of live neighbours for the given cell' do
      cells_to_revive = [grid.cell(4,3), grid.cell(6,4)]
      grid.set_initial_live_cells(cells_to_revive)

      expect( grid.get_live_neighbours(grid.cell(5,4)) ).to contain_exactly(grid.cell(4,3), grid.cell(6,4))
    end
  end

end


