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


  def get_neighbours(cell)

    neighbours = [(cell.position - 10), (cell.position + 10), # vertical
                  (cell.position -  1), (cell.position +  1), # horizontal
                  (cell.position - 11), (cell.position + 11), # left diagonal
                  (cell.position -  9), (cell.position +  9)] # right diagonal
    neighbours
  end

  def get_live_neighbours(cell)
    live_neighbours = []
    neighbours = get_neighbours(cell)

    neighbours.each do |neighbour_cell|
      if neighbour_cell.is_alive?
        live_neighbours << neighbour_cell
      end
    end

    live_neighbours
  end

  def set_cell_status(cell)
    live_neighbours = get_live_neighbours(cell)

    if cell.is_alive?
      if live_neighbours.count < 2
        cell.switch_status
      end
    end

  end

end

