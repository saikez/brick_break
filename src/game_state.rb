# frozen_string_literal: true

require 'singleton'

# Maintain some order
#
class GameState
  include Singleton
  attr_accessor :score, :lives_total, :lives_remaining, :ball_launched

  def initialize
    full_reset
  end

  def full_reset
    max_lives = 5
    @score = 0
    @lives_total = max_lives
    @lives_remaining = max_lives
    @ball_launched = false
  end

  def reset_ball
    @ball_launched = false
  end
end
