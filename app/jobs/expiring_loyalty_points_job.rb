# frozen_string_literal: true

class ExpiringLoyaltyPointsJob < ApplicationJob
  queue_as :default

  def perform
    User.created_in_last_year.update_all(loyalty_points: 0)
  end
end
