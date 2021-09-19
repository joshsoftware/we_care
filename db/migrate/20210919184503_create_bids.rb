class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.string :email
      t.string :mobile
      t.float :bid_amount
      t.references :auction_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
