################################################################################
# Model:  Coin
#
# Purpose: Currencies (fiat & Crypto) to be used
#
# Coin attributes:
#   name    - name:   string, not NULL, unique
#   code    - code:   string, not NULL, unique
#   kind    - type:   integer enum { fiat (0) | crypto (1) }
#   status  - status: integer enum { active (0) | archived (1) }
#
#   Used twice as a foreign key for Pair
#   See: https://www.sitepoint.com/community/t/referencing-the-same-model-twice-in-rails/254243
#
#  24.06.2021 ZT
################################################################################
class Coin < ApplicationRecord
  has_many :coin_nicknames
  has_many :based_pairs,  class_name: 'Pair', foreign_key: 'base_id'
  has_many :quoted_pairs, class_name: 'Pair', foreign_key: 'quote_id'
 
  enum kind: %w(fiat crypto)
  enum status: %w(active archived)

  validates :name,  presence: true, uniqueness: true
  validates :code,  presence: true, uniqueness: true
end

