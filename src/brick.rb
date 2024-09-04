require 'gosu'
require_relative 'vector_2d'
require_relative 'mixins/drawable'

# A literal brick
#
class Brick
  include Drawable

  def initialize(position: Vector2D[], brick_image: nil)
    brick_image = brick_blue.png if brick_image.nil?
    brick_image_path = "assets/images/bricks/#{brick_image}"
    @image = Gosu::Image.new(brick_image_path || 'assets/images/bricks/brick_blue.png')
    @position = position
  end

  def self.dimensions
    sample_brick = Gosu::Image.new('assets/images/bricks/brick_blue.png')

    { width: sample_brick.width, height: sample_brick.height }
  end
end
