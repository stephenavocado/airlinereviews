class FoodJournal < ApplicationRecord
  enum meal: [:breakfast, :lunch, :dinner, :snack]

  def date
    self.created_at.strftime("%D")
  end
end
