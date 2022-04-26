class MoodJournalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :feeling, :intensity, :situation, :who_i_was_with, :primary_thought, :cognitive_distortions
end
