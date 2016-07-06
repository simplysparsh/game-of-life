require 'rspec'
require 'world.rb'

describe 'World'  do

  let(:world) { World.new }
  let(:grid) { world.grid }

  describe '#update_world' do

    context 'when the cell is alive' do

      it 'sets status to dead if cell has less than two live neighbours' do
        cell_positions = [10, 9]
        grid.set_initial_live_cells(cell_positions)

        world.update_world
        expect(grid.cells[10].status).to eq(:dead)
      end

      it 'sets status to dead if cell has more than three live neighbours' do
        cell_positions = [10,9,11,0,20]
        grid.set_initial_live_cells(cell_positions)

        world.update_world
        expect(grid.cells[10].status).to eq(:dead)
      end

      it 'lets the status to be alive if it has two or three live neighbours' do
        cell_positions = [54, 43, 44, 65]
        grid.set_initial_live_cells(cell_positions)

        world.update_world
        expect(grid.cells[54].status).to eq(:alive)
      end
    end

    context 'when the cell is dead' do

      it 'sets status to alive if it has exactly three live neighbours'do
        cell_positions = [20,11,0]
        grid.set_initial_live_cells(cell_positions)

        world.update_world
        expect(grid.cells[10].status).to eq(:alive)

      end
    end

  end

end