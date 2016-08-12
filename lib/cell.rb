class Cell

  attr_reader :x, :y

  def initialize(x, y)
    @x = x # x => column
    @y = y # y => row
  end

  def is_equal?(cell)
    @x == cell.x && @y == cell.y
  end

end

