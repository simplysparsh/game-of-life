class Cell

  attr_reader :status, :position

  def initialize(position, status = :dead)
    @status = status
    @position = position
  end

  def switch_status
    if @status == :dead
      @status = :alive
    else
      @status = :dead
    end
  end

  def is_alive?
    @status == :alive
  end

end

