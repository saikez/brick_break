require 'gosu'
require_relative 'vector_2d'
require_relative 'mixins/drawable'

# Player class
#
class Paddle
  include Drawable

  def initialize(position: Vector2D[])
    @image = Gosu::Image.new('assets/images/paddle.png')
    @previous_position = position
    @position = position
    @speed = 10
  end

  def update
    clamp_new_position
    @previous_position = @position
  end

  def move_to_position(position: Vector2D[])
    distance = position - @position
    distance.x.positive? ? move_right(distance: distance.x) : move_left(distance: distance.x.abs)
  end

  def move_left(distance: @speed)
    @position.x -= [distance, @speed].min
  end

  def move_right(distance: @speed)
    @position.x += [distance, @speed].min
  end

  def clamp_new_position
    speed_vector = Vector2D[@speed, 0]
    @position.clamp(@previous_position - speed_vector, @previous_position + speed_vector)
  end
end
