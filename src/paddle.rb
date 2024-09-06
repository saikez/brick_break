# frozen_string_literal: true

require_relative 'vector_2d'
require_relative 'mixins/drawable'
require_relative 'mixins/collidable'

# Player class
#
class Paddle
  include Drawable
  include Collidable

  def initialize(position: Vector2D[])
    @image = Gosu::Image.new('assets/images/paddle.png')
    @previous_position = position
    @position = position
    @speed = 10
    @collidable = true
    @last_ball_collision = 0
  end

  def update
    clamp_new_position
    @previous_position = @position
  end

  def draw
    @collidable = true if !@collidable && (Gosu.milliseconds - @last_ball_collision) >= 200
    super
  end

  def move_to_position(position)
    distance = position - @position
    distance.x.positive? ? move_right(distance.x) : move_left(distance.x.abs)
  end

  def move_left(distance = @speed)
    @position.x -= [distance, @speed].min
  end

  def move_right(distance = @speed)
    @position.x += [distance, @speed].min
  end

  def clamp_new_position
    speed_vector = Vector2D[@speed, 0]
    @position.clamp(@previous_position - speed_vector, @previous_position + speed_vector)
  end

  def on_collision(other)
    return unless other.instance_of? Ball

    @collidable = false
    @last_ball_collision = Gosu.milliseconds
  end
end
