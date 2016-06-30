require_relative "cell.rb"
require_relative "grid.rb"

class World

  attr_reader :grid

  def initialize
    @grid = Grid.new
  end

  def set_cell_status(cell)
    live_neighbours = grid.get_live_neighbours(cell)

    if cell.is_alive?
      handle_live_cell(cell, live_neighbours)
    else
      handle_dead_cell(cell, live_neighbours)
    end
  end

  private

  def handle_live_cell(cell, live_neighbours)
    if rule_one_applies?(live_neighbours) || rule_two_applies?(live_neighbours)
      cell.switch_status
    end
  end

  def handle_dead_cell(cell, live_neighbours)
    if rule_three_applies?(live_neighbours)
      cell.switch_status
    end
  end

  def rule_one_applies?(live_neighbours)
    live_neighbours.count < 2
  end

  def rule_two_applies?(live_neighbours)
    live_neighbours.count > 3
  end

  def rule_three_applies?(live_neighbours)
    live_neighbours.count == 3
  end

end

