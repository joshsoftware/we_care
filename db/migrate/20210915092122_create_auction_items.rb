class CreateAuctionItems < ActiveRecord::Migration[6.1]
  def change
    create_table :auction_items do |t|
      t.string :name
      t.string :description
      t.float  :min_bid_amount
      t.float  :current_bid_amount
      t.references :user
      t.references :auction
      t.timestamps
    end
  end
end
