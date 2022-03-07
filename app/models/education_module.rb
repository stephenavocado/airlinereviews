class EducationModule < ApplicationRecord
  enum status: [:completed, :skipped]
end
