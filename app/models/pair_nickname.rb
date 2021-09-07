################################################################################
# Model:  PairNickname
#
# Purpose: Currency pair nicknames
#
# PairNickname attributes:
#   pair_id  - FK
#   name     - name: string,  not NULL, unique
#
#  07.09.2021 ZT
################################################################################
class PairNickname < ApplicationRecord
  belongs_to :pair, required: true

  validates :pair, presence: true
  validates :name, presence: true, uniqueness: true

  scope :by_pair_name, -> { joins(:pair).order('pairs.name') }
end
