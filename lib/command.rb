module ToyRobot
  class Command
    require_relative 'robot'

    attr_reader :robot

    def initialize(file_name = nil)
      file_name ||= 'robot_commands.txt'
      File.read(file_name).each_line do |command|
        run(command)
      end
    end

    def run(command)
      command, params = command.downcase.split(/\s+/)
      command = command.to_sym
      if command == :place
        params = params.split(',')
        @robot = ToyRobot::Robot.new(params[0].to_i, params[1].to_i, params[2].to_sym)
      else
        return nil unless robot
        case command
        when :move then robot.move
        when :left then robot.turn_left
        when :right then robot.turn_right
        when :report then puts robot.report
        end
      end
    end
  end
end
