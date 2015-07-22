class Robot
  include Commands::Move
  include Commands::Place
  include Commands::Left
  include Commands::Right
  include Commands::Report

  attr_accessor :x, :y, :direction, :board

  def initialize(board)
    @board = board
  end

  def placed?
    !x.nil? && !y.nil? && !direction.nil?
  end

  def directions
    %w(NORTH EAST SOUTH WEST)
  end
end

