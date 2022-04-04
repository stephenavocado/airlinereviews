class FoodJournalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :breakfast, :lunch, :dinner, :snacks
end