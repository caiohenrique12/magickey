class CreateKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :keys do |t|
      t.references :user, null: false, foreign_key: true
      t.string :password
      t.string :local

      t.timestamps
    end
  end
end
