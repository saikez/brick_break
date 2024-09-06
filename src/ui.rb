# frozen_string_literal: true

require 'gosu'

# So we can have reason to this madness
#
class UI
  include Drawable

  def initialize(window_width, _window_height)
    @empty_heart = Gosu::Image.new('assets/images/heart_empty.png')
    @full_heart = Gosu::Image.new('assets/images/heart_full.png')
    @score_font = Gosu::Font.new(40, { name: 'assets/fonts/venite-adoremus-font/VeniteAdoremus-rgRBA.ttf' })
    @window_width = window_width
  end

  def draw
    draw_score
    draw_hearts
  end

  def draw_score
    text_width = @score_font.text_width("Score: #{GameState.instance.score}")
    x_pos = @window_width - text_width - 20

    @score_font.draw_text("Score: #{GameState.instance.score}", x_pos, 20, 100)
  end

  def draw_hearts
    (1..GameState.instance.lives_total).each { |i| @empty_heart.draw(20 + (@empty_heart.width * (i - 1)), 20) }
    (1..GameState.instance.lives_remaining).each { |i| @full_heart.draw(20 + (@full_heart.width * (i - 1)), 20) }
  end
end
