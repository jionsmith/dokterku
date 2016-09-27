class Inventory < ActiveRecord::Base
  belongs_to :pharmacy
  belongs_to :drug
end
