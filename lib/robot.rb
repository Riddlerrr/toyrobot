module ToyRobot
  class Robot
    TABLE_WIDTH = 5
    TABLE_HEIGHT = 5
    DIRECTIONS = [:north, :east, :south, :west]

    attr_reader :x, :y, :direction

    def initialize(x, y, direction)
      self.x = x
      self.y = y
      self.direction = direction
    end

    def move
      case direction
      when :north then self.y += 1
      when :east  then self.x += 1
      when :south then self.y -= 1
      when :west  then self.x -= 1
      end
    end

    def turn_right
      self.direction = change_direction(:right)
    end

    def turn_left
      self.direction = change_direction(:left)
    end

    def report
      "#{x},#{y},#{direction.to_s.upcase}"
    end

    private

    def x=(value)
      return x || 0 if value < 0 || value > TABLE_WIDTH
      @x = value
    end

    def y=(value)
      return y || 0 if value < 0 || value > TABLE_HEIGHT
      @y = value
    end

    def direction=(value)
      return direction || :north unless DIRECTIONS.include?(value)
      @direction = value
    end

    def change_direction(side)
      current_index = DIRECTIONS.index(direction)
      next_index = side == :right ? (current_index + 1) % 4 : current_index - 1
      DIRECTIONS[next_index]
    end
  end
end
