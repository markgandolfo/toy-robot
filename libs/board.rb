class Board
  def initialize(height:, width:)
    @height = height
    @width = width
  end

  def valid_placement?(x:, y:)
    x = x.to_i
    y = y.to_i

    (x >= 0 && y >= 0 && x <= width && y <= height)
  end

  private
    attr_accessor :height, :width
end

