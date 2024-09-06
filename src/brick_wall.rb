# frozen_string_literal: true

require_relative 'vector_2d'
require_relative 'brick'

# We're going to build a wall!
#
class BrickWall
  attr_reader :bricks

  def initialize(width)
    @bricks = []
    @brick_images = Dir.entries('assets/images/bricks').reject { |e| e.start_with? '.' }
    @brick_dimensions = Brick.dimensions
    @rows = @brick_images.size
    @columns = (width / @brick_dimensions[:width]).floor
    @x_offset = (width % @brick_dimensions[:width]) / 2
    @y_offset = 40
  end

  def build_wall
    (1..@rows).each do |row|
      (1..@columns).each do |column|
        x_position = (@x_offset + @brick_dimensions[:width] * column) - (@brick_dimensions[:width] / 2)
        y_position = @y_offset + (@brick_dimensions[:height] * row)
        brick_position = Vector2D[x_position, y_position]

        brick = Brick.new(position: brick_position, brick_image: @brick_images[row - 1])
        brick.add_listener(self)
        @bricks.push brick
      end
    end
  end

  def break_brick(brick)
    @bricks.delete(brick)
  end

  def draw
    @bricks.each(&:draw)
  end
end
