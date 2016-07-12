require 'gosu'
require_relative 'world.rb'

class GameOfLifeWindow < Gosu::Window

  def initialize(width=500, height=500)
    @width = width
    @height = height
    super width, height, false
    self.caption = "Conway's Game of Life by Sparsh Saxena"

    # Colors
    @background_color = Gosu::Color.new(0xffdedede)
    @alive_color = Gosu::Color.new(0xff121212)
    @dead_color = Gosu::Color.new(0xffededed)

    # Game
    @grid_size = 20
    @col_width = width / @grid_size
    @row_height = height / @grid_size

    @world = World.new(@grid_size)
    @world.grid.randomly_populate

    @generation = 0
  end

  def update
    @world.update_world
    @generation += 1
    puts "Generation No: #{@generation}"
  end

  def draw
    draw_background

    @world.grid.cells.each do |row_cells|
      row_cells.each do |cell|
        x_start = cell.x * @col_width
        y_start = cell.y * @row_height
        if cell.is_alive?
          draw_alive_cell(x_start, y_start)
        else
          draw_dead_cell(x_start, y_start)
        end
      end
    end

  end

  def button_down(id)
    case id
      when Gosu::KbSpace
        @world.grid.randomly_populate
      when Gosu::KbEscape
        close
    end
  end

  def needs_cursor?; true; end

  def draw_background
    draw_quad(0, 0, @background_color,
              width, 0, @background_color,
              width, height, @background_color,
              0, height, @background_color)
  end

  def draw_alive_cell(x_start, y_start)
    draw_quad(x_start, y_start, @alive_color,
              x_start+(@col_width-1), y_start, @alive_color,
              x_start+(@col_width-1), y_start+(@row_height-1), @alive_color,
              x_start, y_start+(@row_height-1), @alive_color)
  end

  def draw_dead_cell(x_start, y_start)
    draw_quad(x_start, y_start, @dead_color,
              x_start+(@col_width-1), y_start, @dead_color,
              x_start+(@col_width-1), y_start+(@row_height-1), @dead_color,
              x_start, y_start+(@row_height-1), @dead_color)
  end

end

# This Gosu GUI implementation is taken from:
# www.github.com/derekbarber/game_of_life/blob/master/gosu.rb