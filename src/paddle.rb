require 'gosu'
require_relative 'vector_2d'

class Paddle
  def initialize(x_pos = 0.0, y_pos = 0.0)
    @image = Gosu::Image.new('assets/images/paddle.png')
    @position = Vector2D[x_pos, y_pos]
    @speed = 1
  end

  def draw
    @image.draw(@position.x, @position.y)
  end

  def move_left
    @position.x -= @speed
  end

  def move_right
    @position.x += @speed
  end
end
