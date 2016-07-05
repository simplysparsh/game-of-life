require_relative "cell.rb"

class Grid

  attr_reader :cells

  def initialize
    @cells = create_cells # 10 x 10 grid
  end

  def set_initial_live_cells(position_list)
    position_list.each do |position|
      @cells[position].revive
    end
  end

  def get_live_neighbours(cell)
    live_neighbours = []
    neighbour_positions = get_neighbour_positions(cell)

    neighbour_positions.each do |neighbour_position|
      neighbour_cell = @cells[neighbour_position]
      live_neighbours << neighbour_cell if neighbour_cell.is_alive?
    end

    live_neighbours
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

  def get_neighbour_positions(cell)
    possible_positions = possible_neighbour_positions(cell)
    get_valid_neighbour_positions(possible_positions)
  end

  def possible_neighbour_positions(cell) #Wrong logic. Needs to be changed.
    [(cell.position - 10), (cell.position + 10), # vertical
     (cell.position -  1), (cell.position +  1), # horizontal
     (cell.position - 11), (cell.position + 11), # left diagonal
     (cell.position -  9), (cell.position +  9)] # right diagonal
  end

  def get_valid_neighbour_positions(possible_positions)
    possible_positions.select do |pos|
      pos >= 0 && pos <= 99
    end
  end


end