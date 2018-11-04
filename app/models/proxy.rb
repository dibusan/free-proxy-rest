class Proxy < ApplicationRecord
  validates :ip, presence: true
  validates_numericality_of :port
end
