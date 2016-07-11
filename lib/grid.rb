require_relative "cell.rb"

class Grid

  attr_reader :cells

  def initialize(grid_size)
    @grid_size = grid_size
    @cells = create_cells(grid_size)
  end

  def cell(x_axis, y_axis)
    @cells[x_axis][y_axis]
  end

  def set_initial_live_cells(cells)
    cells.each do |cell|
      cell.revive
    end
  end

  def get_live_neighbours(cell)
    live_neighbours = []
    neighbours = possible_neighbours(cell)

    neighbours.each do |neighbour|
      live_neighbours << neighbour if neighbour.is_alive?
    end
    live_neighbours
  end

  private

  def create_cells(grid_size)
    column = row = grid_size
    cells = []

    row.times do |y|
      cells << Array.new(column) do |x|
        Cell.new(x, y)
      end
    end
    cells
  end

  def possible_neighbours(cell)
    neighbours = []

    # It detects a neighbour to the North
    if cell.y > 0
      neighbours << cells[cell.y - 1][cell.x]
    end

    # It detects a neighbour to the North-East
    if cell.y > 0 && cell.x < (@grid_size - 1)
      neighbours << cells[cell.y - 1][cell.x + 1]
    end

    # It detects a neighbour to the North-West
    if cell.x > 0 && cell.y > 0
      neighbours << cells[cell.y - 1][cell.x - 1]
    end

    # It detects a neighbour to the East
    if cell.x < (@grid_size - 1)
      neighbours << cells[cell.y][cell.x + 1]
    end

    # It detects a neighbour to the South-East
    if cell.x < (@grid_size - 1) && cell.y < (@grid_size - 1)
      neighbours << cells[cell.y + 1][cell.x + 1]
    end

    # It detects a neighbour to the South
    if cell.y < (@grid_size - 1)
      neighbours << cells[cell.y + 1][cell.x]
    end

    # It detects a neighbour to the South-West
    if cell.y < (@grid_size - 1) && cell.x > 0
      neighbours << cells[cell.y + 1][cell.x - 1]
    end

    # It detects a neighbour to the West
    if cell.x > 0
      neighbours << cells[cell.y][cell.x - 1]
    end

    neighbours
  end

end