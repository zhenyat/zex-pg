################################################################################
# Model:  CoinNickname
#
# Purpose: Currencies Nicknames
#
# CoinNickname attributes:
#   coin_id - FK
#   name    - nickname: string, not NULL, unique
#
#  24.06.2021 ZT
################################################################################
class CoinNickname < ApplicationRecord
  belongs_to :coin, required: true

  validates :coin, presence: true
  validates :name, presence: true, uniqueness: true

  scope :by_coin_name, -> { joins(:coin).order('coins.name') }
end

