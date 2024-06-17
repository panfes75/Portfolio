class User < ApplicationRecord
  has_many :impulse_purchases, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true, on: :create
  validates :nickname, presence: true, length: { in: 2..40 }
end
