require 'gosu'
require_relative 'vector_2d'

class Ball
  def initialize
    @image = Gosu::Image.new('assets/images/ball.png')
    @position = Vector2D[]
  end
end
