require_relative '../lib/robot'

RSpec.describe ToyRobot::Robot do
  subject { robot }

  describe '#initialize' do
    let(:robot) { ToyRobot::Robot.new(1, 2, :north) }

    it 'with correct data' do
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.direction).to eq(:north)
    end
  end

  describe '#move' do
    context 'successful move' do
      it 'to north' do 
        robot = ToyRobot::Robot.new(0, 0, :north)
        robot.move
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(1)
      end

      it 'to east' do 
        robot = ToyRobot::Robot.new(0, 0, :east)
        robot.move
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(0)
      end

      it 'to south' do 
        robot = ToyRobot::Robot.new(5, 5, :south)
        robot.move
        expect(robot.x).to eq(5)
        expect(robot.y).to eq(4)
      end

      it 'to west' do 
        robot = ToyRobot::Robot.new(5, 5, :west)
        robot.move
        expect(robot.x).to eq(4)
        expect(robot.y).to eq(5)
      end
    end

    context 'prevent destruction move' do
      it 'to north' do 
        robot = ToyRobot::Robot.new(5, 5, :north)
        robot.move
        expect(robot.x).to eq(5)
        expect(robot.y).to eq(5)
      end

      it 'to east' do 
        robot = ToyRobot::Robot.new(5, 5, :east)
        robot.move
        expect(robot.x).to eq(5)
        expect(robot.y).to eq(5)
      end

      it 'to south' do 
        robot = ToyRobot::Robot.new(0, 0, :south)
        robot.move
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end

      it 'to west' do 
        robot = ToyRobot::Robot.new(0, 0, :west)
        robot.move
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end
    end
  end

  describe '#turn_left' do
    let(:robot) { ToyRobot::Robot.new(0, 0, :north) }

    it 'successful turn' do
      robot.turn_left
      expect(robot.direction).to eq(:west)
      robot.turn_left
      expect(robot.direction).to eq(:south)
      robot.turn_left
      expect(robot.direction).to eq(:east)
      robot.turn_left
      expect(robot.direction).to eq(:north)
    end
  end

  describe '#turn_right' do
    let(:robot) { ToyRobot::Robot.new(0, 0, :north) }

    it 'successful turn' do
      robot.turn_right
      expect(robot.direction).to eq(:east)
      robot.turn_right
      expect(robot.direction).to eq(:south)
      robot.turn_right
      expect(robot.direction).to eq(:west)
      robot.turn_right
      expect(robot.direction).to eq(:north)
    end
  end

  describe '#report' do
    let(:robot) { ToyRobot::Robot.new(0, 0, :north) }

    it { expect(robot.report).to eq('0,0,NORTH') }
  end
end
