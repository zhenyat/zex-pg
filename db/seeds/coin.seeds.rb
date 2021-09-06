begin
  if (Coin.present? and not Coin.exists?)
    Coin.create name: 'Euro',               code: 'EUR'
    Coin.create name: 'British Pound',      code: 'GBP'
    Coin.create name: 'Australian Dollar',  code: 'AUD', status: 'archived'
    Coin.create name: 'New Zealand Dollar', code: 'NZD', status: 'archived'
    Coin.create name: 'US Dollar',          code: 'USD'
    Coin.create name: 'Swiss Franc',        code: 'CHF', status: 'archived'
    Coin.create name: 'Japanese Yen',       code: 'JPY', status: 'archived'
    Coin.create name: 'Canadian Dollar',    code: 'CAD', status: 'archived'
    Coin.create name: 'Russian Ruble',      code: 'RUB'
    
    Coin.create name: 'Bitcoin',          code: 'BTC', kind: 'crypto'
    Coin.create name: 'Bitcoin Cash',     code: 'BCH', kind: 'crypto'
    Coin.create name: 'Bitcoin Gold',     code: 'BCG', kind: 'crypto'
    Coin.create name: 'Ethereum',         code: 'ETH', kind: 'crypto'
    Coin.create name: 'Ethereum Classic', code: 'ETC', kind: 'crypto'
    Coin.create name: 'Litecoin',         code: 'LTC', kind: 'crypto'

    puts "===== 'Coin' #{Coin.count} record(s) created"
  else
    puts "===== 'Coin' seeding skipped"
  end
rescue
puts "----- Achtung! Something went wrong ('Coin' entity does not exist?)"
end