class FoodJournalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :breakfast, :lunch, :dinner, :snacks
end