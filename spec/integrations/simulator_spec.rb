require 'spec_helper'

RSpec.describe Simulator do
  subject(:simulator) { described_class.new }
  let(:instructions) do
    [ 'PLACE 0,0,NORTH',
      'MOVE',
      'RIGHT',
      'MOVE',
      'LEFT',
      'MOVE',
      'REPORT'
    ]
  end

  context 'with default robot, board and parser' do
    it 'should allow the robot to move, turn and report' do
      expect{simulator.run(instructions:instructions)}.to output("1,2,NORTH\n").to_stdout
    end
  end
end
