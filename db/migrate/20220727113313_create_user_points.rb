class CreateUserPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :user_points do |t|
      t.integer :earned_point
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
