class AddNameInBid < ActiveRecord::Migration[6.1]
  def change
    add_column :bids, :name, :string
  end
end
