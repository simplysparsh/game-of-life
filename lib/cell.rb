class Cell

  def initialize(status = :dead)
    @status = status
  end

  def get_live_neighbours
    []
  end

  def get_status
    if get_live_neighbours.count < 2
      @status = :dead
    end
  end


end

