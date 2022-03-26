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
end
