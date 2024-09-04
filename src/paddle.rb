require 'gosu'
require_relative 'vector_2d'
require_relative 'mixins/drawable'

# Player class
#
class Paddle
  include Drawable

  def initialize(position: Vector2D[])
    @image = Gosu::Image.new('assets/images/paddle.png')
    @position = position
    @speed = 10
  end

  def move_left
    @position.x -= @speed
  end

  def move_right
    @position.x += @speed
  end
end
