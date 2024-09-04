require 'gosu'
require_relative 'paddle'
require_relative 'brick'
require_relative 'ball'
require_relative 'vector_2d'

# It's game time!
#
class BrickBreak < Gosu::Window
  def initialize
    super 800, 600
    self.caption = 'BrickBreak'

    prepare_player
    prepare_bricks
    prepare_ball
  end

  def prepare_player
    @player = Paddle.new position: Vector2D[width / 2, height - 40]
    half_paddle_width = @player.image.width / 2
    @player_bounds = [
      Vector2D[half_paddle_width, 0],
      Vector2D[width - half_paddle_width, height]
    ]
  end

  def prepare_bricks
    @bricks = []
    brick_images = Dir.entries('assets/images/bricks').reject{ |e| e.start_with? '.' }
    brick_dimensions = Brick.dimensions
    rows = brick_images.size
    columns = (width / brick_dimensions[:width]).floor
    offset = (width % brick_dimensions[:width]) / 2

    rows.times do |row|
      columns.times do |column|
        x_position = (offset + brick_dimensions[:width] * column) - (brick_dimensions[:width] / 2)
        y_position = 40 + (brick_dimensions[:height] * row)
        brick_position = Vector2D[x_position, y_position]

        @bricks.push Brick.new(position: brick_position, brick_image: brick_images[row - 1])
      end
    end
  end

  def prepare_ball
    Ball.new
  end

  def update
    @player.move_left if Gosu.button_down?(Gosu::KB_LEFT) || Gosu::button_down?(Gosu::GP_LEFT)
    @player.move_right if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu::button_down?(Gosu::GP_RIGHT)
    @player.position.clamp(*@player_bounds)
  end

  def draw
    @player.draw
    @bricks.each(&:draw)
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end
