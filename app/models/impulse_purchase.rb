class ImpulsePurchase < ApplicationRecord
  belongs_to :user
  has_one :operation_plan, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :purchase_amount, presence: true
  validates :hourly_wage, presence: true
  validates :operating_time, presence: true
end
