class FoodJournalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :meal, :feeling_before, :feeling_after, :food
end