class Trade < ApplicationRecord
  belongs_to :financical, optional: true
end
