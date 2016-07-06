require_relative "cell.rb"
require_relative "grid.rb"

class World

  attr_reader :grid

  def initialize
    @grid = Grid.new
  end

  def update_world
    cells_to_update = get_cells_to_update
    kill_cells(cells_to_update[:cells_to_kill])
    revive_cells(cells_to_update[:cells_to_revive])
  end

  private

  def get_cells_to_update
    cells_to_update = {cells_to_kill:[], cells_to_revive:[]}
    
    @grid.cells.each do |cell|
      if cell_should_die?(cell)
        cells_to_update[:cells_to_kill] << cell
      elsif cell_should_live?(cell)
        cells_to_update[:cells_to_revive] << cell
      end
    end
    cells_to_update
  end

  def cell_should_die?(cell)
    rule_one_applies?(cell) || rule_two_applies?(cell)
  end

  def cell_should_live?(cell)
    rule_three_applies?(cell) || rule_four_applies?(cell)
  end

  def kill_cells(cells)
    cells.each do |cell|
      cell.kill
    end
  end

  def revive_cells(cells)
    cells.each do |cell|
      cell.revive
    end
  end

  def rule_one_applies?(cell)
    live_neighbours = @grid.get_live_neighbours(cell)
    live_neighbours.count < 2 && cell.is_alive?
  end

  def rule_two_applies?(cell)
    live_neighbours = @grid.get_live_neighbours(cell)
    live_neighbours.count > 3 && cell.is_alive?
  end

  def rule_three_applies?(cell)
    live_neighbours = @grid.get_live_neighbours(cell)
    live_neighbours.count == 3 && cell.is_dead?
  end

  def rule_four_applies?(cell)
    live_neighbours = @grid.get_live_neighbours(cell)
    cell.is_alive? && ([2, 3].include? live_neighbours)
  end

end

