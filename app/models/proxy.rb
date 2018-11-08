class Proxy < ApplicationRecord
  validates :ip, presence: true, format: { with: /\A(\d{1,3}\.){3}\d{1,3}\z/i}
  validates_numericality_of :port
end
