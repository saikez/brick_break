# frozen_string_literal: true

require 'singleton'

# Maintain some order
#
class GameState
  include Singleton
  attr_accessor :score, :lives_total, :lives_remaining, :ball_launched, :game_over

  def initialize
    full_reset
  end

  def full_reset
    max_lives = 5
    @score = 0
    @lives_total = max_lives
    @lives_remaining = max_lives
    @ball_launched = false
    @game_over = false
  end

  def lose_life
    @lives_remaining -= 1
    @ball_launched = false
    @game_over = true if @lives_remaining <= 0
  end
end
