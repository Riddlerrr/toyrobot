require_relative '../lib/command'

RSpec.describe ToyRobot::Command do

  describe '#initialize' do
    let(:command) { ToyRobot::Command.new('spec/test_commands.txt') }

    it 'with correct data' do
      robot = command.robot
      expect(robot.x).to eq(2)
      expect(robot.y).to eq(3)
      expect(robot.direction).to eq(:east)
    end
  end
end
