# frozen_string_literal: true

require 'gosu'

# So we can have reason to this madness
#
class UI
  include Drawable

  def initialize(window_width, window_height)
    @font_height = 40
    @empty_heart = Gosu::Image.new('assets/images/heart_empty.png')
    @full_heart = Gosu::Image.new('assets/images/heart_full.png')
    @score_font = Gosu::Font.new(@font_height, name: 'assets/fonts/venite-adoremus-font/VeniteAdoremus-rgRBA.ttf')
    @window_width = window_width
    @window_height = window_height
  end

  def draw
    return draw_game_over_screen if GameState.instance.game_over
    draw_score
    draw_hearts
  end

  def draw_score
    score_text = "Score: #{GameState.instance.score}"
    text_width = @score_font.text_width(score_text)
    x_pos = @window_width - text_width - 20

    @score_font.draw_text(score_text, x_pos, 20, 100)
  end

  def draw_hearts
    (1..GameState.instance.lives_total).each { |i| @empty_heart.draw(20 + (@empty_heart.width * (i - 1)), 20) }
    (1..GameState.instance.lives_remaining).each { |i| @full_heart.draw(20 + (@full_heart.width * (i - 1)), 20) }
  end

  def draw_game_over_screen
    game_over_text = 'Game Over!'
    final_score = "Final Score: #{GameState.instance.score}"
    retry_text = 'Retry?'
    press_space_text = 'Press Space'
    @score_font.draw_text(
      game_over_text,
      (@window_width / 2) - (@score_font.text_width(game_over_text) / 2),
      (@window_height / 2) - ((@font_height / 2) * 5),
      100
    )
    @score_font.draw_text(
      final_score,
      (@window_width / 2) - (@score_font.text_width(final_score) / 2),
      (@window_height / 2) - ((@font_height / 2) * 3),
      100
    )
    @score_font.draw_text(
      retry_text,
      (@window_width / 2) - (@score_font.text_width(retry_text) / 2),
      (@window_height / 2) + (@font_height / 2),
      100
    )
    @score_font.draw_text(
      press_space_text,
      (@window_width / 2) - (@score_font.text_width(press_space_text) / 2),
      (@window_height / 2) + ((@font_height / 2) * 3),
      100
    )
  end
end
