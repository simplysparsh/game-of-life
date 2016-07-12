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

  def randomly_populate
    @cells.each do |row_cells|
      row_cells.each do |cell|
        action = [:kill, :revive].sample
        cell.kill if action == :kill
        cell.revive if action == :revive
      end
    end
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

    # North
    neighbours << cells[cell.y - 1][cell.x] if cell.y > 0

    # South
    neighbours << cells[cell.y + 1][cell.x] if cell.y < (@grid_size - 1)

    # East
    neighbours << cells[cell.y][cell.x + 1] if cell.x < (@grid_size - 1)

    # West
    neighbours << cells[cell.y][cell.x - 1] if cell.x > 0

    # North-East
    neighbours << cells[cell.y - 1][cell.x + 1] if cell.y > 0 && cell.x < (@grid_size - 1)

    # North-West
    neighbours << cells[cell.y - 1][cell.x - 1] if cell.x > 0 && cell.y > 0

    # South-East
    neighbours << cells[cell.y + 1][cell.x + 1] if cell.x < (@grid_size - 1) && cell.y < (@grid_size - 1)

    # South-West
    neighbours << cells[cell.y + 1][cell.x - 1] if cell.y < (@grid_size - 1) && cell.x > 0

    neighbours
  end

end