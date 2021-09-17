class AddImageUrlInAuctionImage < ActiveRecord::Migration[6.1]
  def change
    add_column :auction_items, :image_url, :string
  end
end
