class PainJournalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :pain_score, :pain_setting, :pain_feeling, :who_with, :coping_strategies, :other_notes, :pain_after
end