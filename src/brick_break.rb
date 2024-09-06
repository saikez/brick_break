# frozen_string_literal: true

require 'gosu'
require_relative 'paddle'
require_relative 'brick_wall'
require_relative 'brick'
require_relative 'ball'
require_relative 'vector_2d'

# It's game time!
#
class BrickBreak < Gosu::Window
  def initialize
    super 800, 600
    self.caption = 'BrickBreak'
    @mouse_movement = false
    @previous_mouse_position = Vector2D[]
    @ball_launched = false

    prepare_player
    prepare_bricks
    prepare_ball
  end

  def prepare_player
    @player = Paddle.new position: Vector2D[width / 2, height - 40]
    @player_bounds = [
      Vector2D[@player.half_width, 0],
      Vector2D[width - @player.half_width, height]
    ]
  end

  def prepare_bricks
    @brick_wall = BrickWall.new(width)
    @brick_wall.build_wall
  end

  def prepare_ball
    @ball = Ball.new
  end

  def update
    player_movement
    ball_movement
    collisions
  end

  def player_movement
    mouse_position = Vector2D[mouse_x, mouse_y]
    if !@mouse_movement && @previous_mouse_position != mouse_position && point_within_window?(mouse_position)
      @mouse_movement = true
      @previous_mouse_position = mouse_position
    end

    player_keyboard_movement
    @player.move_to_position(position: mouse_position) if @mouse_movement

    @player.position.clamp(*@player_bounds)
  end

  def player_keyboard_movement
    if Gosu.button_down?(Gosu::KB_LEFT) || Gosu.button_down?(Gosu::GP_LEFT)
      @player.move_left
      @mouse_movement = false
    end
    if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu.button_down?(Gosu::GP_RIGHT)
      @player.move_right
      @mouse_movement = false
    end

    # Prevent Rubocop autocorrecting above if statement to guard clause
    true
  end

  def readied_ball_position
    return if @ball_launched

    offset = (@ball.height / 2) + (@player.height / 2)
    @ball.position = @player.position - Vector2D[0, offset]
  end

  def ball_movement
    readied_ball_position

    @ball.update
  end

  def collisions
    @brick_wall.bricks.each do |brick|
      brick.on_collision(@ball) if @ball.collides_with?(brick)
    end

    @ball.collides_with?(@player)

    @ball.collision_normal = Vector2D.right if @ball.position.x <= @ball.half_width
    @ball.collision_normal = Vector2D.left if @ball.position.x >= width - @ball.half_width
    @ball.collision_normal = Vector2D.down if @ball.position.y <= @ball.half_height
    @ball.collision_normal = Vector2D.up if @ball.position.y >= height - @ball.half_height
  end

  def draw
    @player.draw
    @brick_wall.draw
    @ball.draw
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    elsif !@ball_launched && id == Gosu::KB_SPACE
      @ball_launched = true
      @ball.launch
    else
      super
    end
  end

  def point_within_window?(point)
    point.x.between?(0, width) && point.y.between?(0, height)
  end
end
