# frozen_string_literal: true

class LoyaltyPointsController < ApplicationController
  def index
    @loyalty_points = current_user.user_points
    @total_points = @loyalty_points.blank? ? 0 : @loyalty_points.sum(:earned_point)
  end
end
