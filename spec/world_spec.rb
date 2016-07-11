require 'rspec'
require 'world.rb'

describe 'World'  do

  let(:world) { World.new(10) }
  let(:grid) { world.grid }

  describe '#update_world' do

    context 'when the cell is alive' do

      it 'sets status to dead if cell has less than two live neighbours' do
        cells_to_revive = [grid.cell(0,1), grid.cell(9,0)]
        grid.set_initial_live_cells(cells_to_revive)

        world.update_world
        expect(grid.cell(0,1).status).to eq(:dead)
      end

      it 'sets status to dead if cell has more than three live neighbours' do
        cells_to_revive = [grid.cell(0,1), grid.cell(1,1),
                           grid.cell(1,0), grid.cell(0,0), grid.cell(0,2)]

        grid.set_initial_live_cells(cells_to_revive)

        world.update_world
        expect(grid.cell(0,1).status).to eq(:dead)
      end

      it 'lets the status to be alive if it has two or three live neighbours' do
        cells_to_revive = [grid.cell(4,5), grid.cell(3,4),
                           grid.cell(4,4), grid.cell(5,6)]

        grid.set_initial_live_cells(cells_to_revive)

        world.update_world
        expect(grid.cell(4,5).status).to eq(:alive)
      end
    end

    context 'when the cell is dead' do

      it 'sets status to alive if it has exactly three live neighbours'do
        cells_to_revive = [grid.cell(0,2), grid.cell(1,1), grid.cell(0,0)]
        grid.set_initial_live_cells(cells_to_revive)

        world.update_world
        expect(grid.cell(0,1).status).to eq(:alive)
      end
    end

  end

end