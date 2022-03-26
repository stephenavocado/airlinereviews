class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :uid

  #has_many  :bookmarks
  has_many  :education_modules
  #has_many  :food_journals
  #has_many  :mood_journals
  #has_many  :movement_modules
  has_many  :pain_journals
  #has_many  :smart_goals
end
