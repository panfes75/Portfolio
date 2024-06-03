class OperationPlan < ApplicationRecord
  belongs_to :impulse_purchase

  validates :task, presence: true
  validates :work_time, presence: true
  validates :stamp, presence: true
end
