class PainJournal < ApplicationRecord
  def date
    self.created_at.strftime("%D")
  end
end
