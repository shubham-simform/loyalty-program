class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :country
      t.decimal :amount

      t.timestamps
    end
    add_reference :transactions, :user, null: false, foreign_key: true
  end
end
