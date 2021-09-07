################################################################################
# Model:  Pair
#
# Purpose: Forex Currency Pair
#
# Pair attributes:
#   base_id        - FK
#   quote_id       - FK
#   name           - name:            string,  not NULL, unique ! Set automatically
#   code           - code:            string,  not NULL, unique ! Set automatically
#   level          - Liquidity Level: enum { Major (0) | Minor (1) | Exotic (2)}
#   decimal_places - decimal_places:  integer
#   min_price      - min_price:       decimal
#   max_price      - max_price:       integer
#   min_amount     - min_amount:      decimal
#   hidden         - hidden:          integer
#   fee            - fee:             decimal
#   status         - status:          enum { active (0) | archived (1) }
#
#  07.09.2021 ZT
################################################################################
class Pair < ApplicationRecord
  belongs_to :base,  class_name: 'Coin'
  belongs_to :quote, class_name: 'Coin'

  enum level:  %w(Major Minor Exotic)
  enum status: %w(active archived)

  validates :base,  presence: true
  validates :quote, presence: true
  validates :name,  presence: true, uniqueness: true
  validates :code,  presence: true, uniqueness: true

  def set_pair_code
    "#{base.code}/#{quote.code}"
  end

  def set_pair_name
    "#{base.code.downcase}_#{quote.code.downcase}"
  end
end
