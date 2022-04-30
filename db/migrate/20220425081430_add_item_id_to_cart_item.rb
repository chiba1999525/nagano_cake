class AddItemIdToCartItem < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :item_id, :integre
  end
end
