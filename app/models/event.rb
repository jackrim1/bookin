class Event < ApplicationRecord
  belongs_to :mess, optional: true
end
