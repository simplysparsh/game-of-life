class Cell

  attr_reader :status, :position, :x, :y

  def initialize(x, y, status = :dead)
    @status = status
    @x = x # x => column
    @y = y # y => row
  end

  def is_alive?
    @status == :alive
  end

  def is_dead?
    @status == :dead
  end

  def kill
    @status = :dead
  end

  def revive
    @status = :alive
  end

end

