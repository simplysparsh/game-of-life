require 'rspec'
require 'world.rb'

describe 'World'  do

  describe '#set_cell_status' do

    let(:world) { World.new }

    context 'when the cell is alive' do

      it 'sets status to dead if cell has less than two live neighbours' do
        world.set_initial_live_cells([10,9])
        world.set_cell_status(world.grid[10])

        expect(world.grid[10].status).to eq(:dead)
      end

      it 'sets status to dead if cell has more than three live neighbours' do
        world.set_initial_live_cells([10,9,11,0,20])
        world.set_cell_status(world.grid[10])

        expect(world.grid[10].status).to eq(:dead)
      end

      it 'continues to live if it has two or three live neighbours' do
        world.set_initial_live_cells([10,9,11])
        world.set_cell_status(world.grid[10])

        expect(world.grid[10].status).to eq(:alive)
      end
    end

    context 'when the cell is dead' do

      it 'comes to life if it has exactly three live neighbours'do
        world.set_initial_live_cells([9,11,0])
        world.set_cell_status(world.grid[10])

        expect(world.grid[10].status).to eq(:alive)

      end
    end

  end


end