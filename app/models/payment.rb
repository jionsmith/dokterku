class Payment < ActiveRecord::Base
  belongs_to :billing
end
