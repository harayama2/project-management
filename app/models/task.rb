class Task < ApplicationRecord
  belongs_to :owner, class_name: "User", optional: true
  belongs_to :project, touch: true, optional: true

  enum :status, { not_started: 0, in_progress: 1, completed: 2 }

  validates :name, presence: true
  validates :ends_at, comparison: { greater_than_or_equal_to: :starts_at, allow_blank: true }
end
