require 'gosu'
require_relative 'world.rb'

class GameOfLifeWindow < Gosu::Window

  def initialize(width=600, height=600)
    @width = width
    @height = height
    super width, height, false
    self.caption = "Conway's Game of Life by Sparsh Saxena"

    # Colors
    @background_color = Gosu::Color.new(0xffdedede)
    @alive_color = Gosu::Color.new(0xff121212)
    @dead_color = Gosu::Color.new(0xffededed)

    # Game
    @grid_size = 25
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

    @world.grid.cell_positions.each do |position|
      x_start = position[:x] * @col_width
      y_start = position[:y] * @row_height

      if @world.grid.cell_exists?(position)
        draw_cell(x_start, y_start, @alive_color)
      else
        draw_cell(x_start, y_start, @dead_color)
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

  def draw_cell(x_start, y_start, color)
    draw_quad(x_start, y_start, color,
              x_start+(@col_width-1), y_start, color,
              x_start+(@col_width-1), y_start+(@row_height-1), color,
              x_start, y_start+(@row_height-1), color)
  end

end

# This Gosu GUI implementation is taken
# from Derek Barber : http://bit.ly/29zq5yA