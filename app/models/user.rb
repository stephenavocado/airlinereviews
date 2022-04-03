class User < ApplicationRecord
  #has_many  :bookmarks
  has_many  :education_modules
  #has_many  :food_journals
  #has_many  :mood_journals
  #has_many  :movement_modules
  has_many  :pain_journals
  #has_many  :smart_goals

  enum role: [:standard, :admin]
  enum program_pace_goal: [:slow, :medium, :fast]

  def food_journal_today
    if 
      self.food_journals.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count !== 0
      return true
    end
  end

end
