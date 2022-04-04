class FoodJournal < ApplicationRecord
  enum meal: [:breakfast, :lunch, :dinner, :snack]

  def date
    self.created_at.strftime("%-m/%-d/%y")
  end
end
