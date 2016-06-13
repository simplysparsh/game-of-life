require_relative "cell.rb"

class World

  attr_reader :grid

  def initialize
    @grid = create_cells
  end

  private

  def create_cells # 10 x 10 grid
    cells = []
    position = 0
    100.times do
      cells << Cell.new(position)
      position = position + 1
    end
    cells
  end


  def get_neighbours(cell_position)

    neighbours = [(cell_position - 10), (cell_position + 10), # vertical
                  (cell_position -  1), (cell_position +  1), # horizontal
                  (cell_position - 11), (cell_position + 11), # left diagonal
                  (cell_position -  9), (cell_position +  9)] # right diagonal
    neighbours
  end

  def get_live_neighbours(cell_position)
    neighbours = get_neighbours(cell_position)
    live_neighbours = []

    neighbours.each do |neighbour_cell|
      if neighbour_cell.status == :alive
        live_neighbours << neighbour_cell
      end
    end
    live_neighbours
  end

  def set_cell_status(cell_position)
    current_cell = @grid[cell_position]
    live_neighbours = get_live_neighbours(cell_position)

    if current_cell.status == :alive
      if live_neighbours.count < 2
        current_cell.switch_status
      end
    end

  end

end

