require 'rspec'
require 'world.rb'

describe 'World'  do

  let(:world) { World.new(10) }
  let(:grid) { world.grid }

  describe '#update_world' do

    context 'when the cell is alive' do
      let(:updated_world) {World.new(10)}

      it 'sets status to dead if cell has less than two live neighbours' do
        world.set_initial_live_cells([{x: 0, y: 1}, {x: 9, y: 0}])

        world.update_world

        expect(world.is_equal?(updated_world)).to be(true)
        expect(grid.cells.length).to be 0
      end

      it 'sets status to dead if cell has more than three live neighbours' do
        world.set_initial_live_cells(
            [{x: 0, y: 1}, {x: 1, y: 1},
             {x: 1, y: 0}, {x: 0, y: 0}, {x: 0, y: 2}])
        updated_world.set_initial_live_cells(
            [{x: 0, y: 0}, {x: 1, y: 0}, {x: 0, y:2}])

        world.update_world

        expect(world.is_equal?(updated_world)).to be(true)
        expect(grid.cells.length).to be 3
      end

      it 'lets the status to be alive if it has two or three live neighbours' do

        world.set_initial_live_cells(
            [{x: 4, y: 5}, {x: 3, y: 4}, {x: 4, y: 4}, {x: 5, y: 6}])
        updated_world.set_initial_live_cells(
            [{x: 4, y: 4}, {x: 4, y: 5}, {x: 3, y: 4}])

        world.update_world

        expect(world.is_equal?(updated_world)).to be(true)
        expect(grid.cells.length).to be 3
      end
    end


    context 'when the cell is dead' do
      let(:updated_world) {World.new(10)}

      it 'sets status to alive if it has exactly three live neighbours'do
        world.set_initial_live_cells([{x: 0, y: 2}, {x: 1, y: 1}, {x: 0, y: 0}])
        updated_world.set_initial_live_cells([{x: 0, y: 1}, {x: 1, y: 1}])

        world.update_world

        expect(world.is_equal?(updated_world)).to be(true)
        expect(grid.cells.length).to be 2
      end
    end


    context 'when a world has a particular cell distribution on the grid' do
      let(:updated_world) {World.new(10)}

      it 'updates the world to a newer cell distribution as per the game rules' do

        world.set_initial_live_cells(
            [{x: 1, y: 2},{x: 2, y: 2},{x: 3, y: 2},
             {x: 0, y: 9},{x: 1, y: 8},{x: 2, y: 7},
             {x: 9, y: 9},{x: 8, y: 9},{x: 8, y: 8},{x: 9, y: 8}])
        updated_world.set_initial_live_cells(
            [{x: 1, y: 8}, {x: 2, y: 2},{x: 2, y: 1},{x: 2, y: 3},
             {x: 9, y: 9},{x: 8, y: 9},{x: 8, y: 8},{x: 9, y: 8}])

        world.update_world
        expect(world.is_equal?(updated_world)).to be(true)
      end
    end

  end
end