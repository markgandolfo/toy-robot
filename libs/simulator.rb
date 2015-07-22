Dir[File.expand_path('../commands/*.rb', __FILE__)].each{|f| require f}
require './libs/robot'
require './libs/board'
require './libs/parser'

class Simulator
  BOARD_WIDTH=5
  BOARD_HEIGHT=5
  VALID_COMMANDS=Dir[File.expand_path('../commands/*.rb', __FILE__)].map { |f| File.basename(f, '.rb') }

  def initialize( board:Board.new(width:BOARD_WIDTH,height:BOARD_HEIGHT),
                  robot:Robot.new(board),
                  parser:Parser.new(valid_commands:VALID_COMMANDS))
    @board = board
    @robot = robot
    @parser = parser
  end

  def run(instructions:)
    @instructions = instructions
    instructions.each do |instruction|
      if parser.valid?(instruction)
        command, args = instruction.downcase.split(' ')
        robot.send(command, args)
      end
    end
  end

  private
  attr_accessor :robot, :board, :parser, :instructions
end

