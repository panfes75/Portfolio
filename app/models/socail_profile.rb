class SocailProfile < ApplicationRecord
  belongs_to :user, optional: true
  validates :uid, uniqueness: {scope: :provider}
end
