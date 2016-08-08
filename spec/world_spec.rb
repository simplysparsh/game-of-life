require 'rspec'
require 'world.rb'
require 'grid.rb'


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

    context 'when a world has a particular cell distribution on the grid' do
      let(:expected_world) {World.new(10)}

      it 'updates the world to a newer cell distribution as per the game rules' do
        world.set_initial_live_cells(
            [world.grid.cell(1,2), world.grid.cell(2,2), world.grid.cell(3,2),
             world.grid.cell(0,9), world.grid.cell(1,8), world.grid.cell(2,7),
             world.grid.cell(9,9), world.grid.cell(8,9), world.grid.cell(8,8), world.grid.cell(9,8)])
        expected_world.set_initial_live_cells([expected_world.grid.cell(1,8),
                                               expected_world.grid.cell(2,2), expected_world.grid.cell(2,1), expected_world.grid.cell(2,3),
                                               expected_world.grid.cell(9,9), expected_world.grid.cell(8,9), expected_world.grid.cell(8,8), expected_world.grid.cell(9,8)])

        world.update_world

        expect(world.is_equal?(expected_world)).to be(true)
      end

    end


  end

end