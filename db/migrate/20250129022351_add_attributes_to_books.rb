class AddAttributesToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :author, :string
    add_column :books, :price, :decimal
    add_column :books, :publish_date, :date
  end
end
