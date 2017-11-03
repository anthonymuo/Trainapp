class Ticket < ApplicationRecord
  
 validates :started, presence: true
 validates :ended, presence: true
 validates :day, presence: true

end
