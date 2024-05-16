class OperationPlan < ApplicationRecord
  belongs_to :impulse_purchase
  has_one :week_schedule, dependent: :destroy
end
