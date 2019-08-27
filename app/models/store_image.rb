class StoreImage < ApplicationRecord
	belongs_to :store
	attachment :item_image
end
