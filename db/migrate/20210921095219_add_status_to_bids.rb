class AddStatusToBids < ActiveRecord::Migration[6.1]
  def change
    add_column :bids, :status, :string
  end
end
