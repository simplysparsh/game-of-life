require_relative "cell.rb"

class World

  attr_reader :grid

  def initialize
    @grid = create_cells # 10 x 10 grid
  end

  def set_cell_status(cell)
    live_neighbours = get_live_neighbours(cell)

    if cell.is_alive?
      handle_live_cell(cell, live_neighbours)
    else
      handle_dead_cell(cell, live_neighbours)
    end
  end

  def set_initial_live_cells(position_list)
    position_list.each do |position|
      @grid[position].switch_status
    end
  end

  private

  def create_cells
    cells = []
    position = 0
    100.times do
      cells << Cell.new(position)
      position = position + 1
    end
    cells
  end

  def get_live_neighbours(cell)
    live_neighbours = []
    neighbour_positions = get_neighbour_positions(cell)

    neighbour_positions.each do |neighbour_position|
      neighbour_cell = @grid[neighbour_position]
      live_neighbours << neighbour_cell if neighbour_cell.is_alive?
    end

    live_neighbours
  end

  def get_neighbour_positions(cell)
    [(cell.position - 10), (cell.position + 10), # vertical
     (cell.position -  1), (cell.position +  1), # horizontal
     (cell.position - 11), (cell.position + 11), # left diagonal
     (cell.position -  9), (cell.position +  9)] # right diagonal
  end


  def handle_dead_cell(cell, live_neighbours)
    if live_neighbours.count == 3
      cell.switch_status
    end
  end

  def handle_live_cell(cell, live_neighbours)
    if live_neighbours.count < 2 || live_neighbours.count > 3
      cell.switch_status
    end
  end

end

