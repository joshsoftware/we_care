class CreateAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :auctions do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.string   :address
      t.string   :name
      t.string   :banner_url
      t.timestamps
    end
  end
end
