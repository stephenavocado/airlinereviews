class PainJournal < ApplicationRecord
  def date
    self.created_at.strftime("%-m/%-d/%y")
  end
end
