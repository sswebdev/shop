class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :ordered_on

      t.timestamps
    end
  end
end
