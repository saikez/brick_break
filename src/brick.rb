# frozen_string_literal: true

require_relative 'vector_2d'
require_relative 'mixins/drawable'
require_relative 'mixins/collidable'
require_relative 'mixins/listenable'

# A literal brick
#
class Brick
  include Drawable
  include Collidable
  include Listenable

  def initialize(position: Vector2D[], brick_image: nil, value: 0)
    brick_image = 'brick_blue.png' if brick_image.nil?
    brick_image_path = "assets/images/bricks/#{brick_image}"
    @image = Gosu::Image.new(brick_image_path || 'assets/images/bricks/brick_blue.png')
    @position = position
    @collidable = true
    @value = value
  end

  def self.dimensions
    sample_brick = Gosu::Image.new('assets/images/bricks/brick_blue.png')

    { width: sample_brick.width, height: sample_brick.height }
  end

  def on_collision(other)
    return unless other.instance_of?(Ball)

    GameState.instance.score += @value
    notify_listeners(:break_brick, self)
  end
end
