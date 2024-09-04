require 'gosu'
require_relative 'vector_2d'
require_relative 'mixins/drawable'

# Boing
#(vector = Vector2D[]
class Ball
  include Drawable

  def initialize(position: Vector2D[])
    @image = Gosu::Image.new('assets/images/ball.png')
    @position = position
  end
end
