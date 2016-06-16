class Cell

  attr_reader :status, :position

  def initialize(position, status = :dead)
    @status = status
    @position = set_position(position)
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

  private

  def set_position(position)
    if position.is_a?(NilClass)
      raise "position can't be nil"
    elsif position.is_a?(Fixnum) && position < 100
      return position
    else
      raise 'position should be an integer less than 100'
    end
  end

end

