class AddShippingChargeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_charge, :integer, default: 0
  end
end
