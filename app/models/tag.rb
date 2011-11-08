class Tag < ActiveRecord::Base
  belongs_to :product
  belongs_to :page
end
