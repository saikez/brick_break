require 'gosu'
require_relative 'paddle'

class BrickBreak < Gosu::Window
  def initialize
    super 640, 480
    self.caption = 'BrickBreak'

    @player = Paddle.new
  end

  def update
    if Gosu.button_down?(Gosu::KB_LEFT) || Gosu::button_down?(Gosu::GP_LEFT)
      @player.move_left
    end
    if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu::button_down?(Gosu::GP_RIGHT)
      @player.move_right
    end
  end

  def draw
    @player.draw
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end
