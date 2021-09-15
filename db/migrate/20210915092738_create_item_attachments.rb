class CreateItemAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :item_attachments do |t|
      t.string :file_url
      t.references :auction_item
      t.timestamps
    end
  end
end
