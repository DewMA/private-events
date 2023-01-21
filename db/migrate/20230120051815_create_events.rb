class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.string :location
      t.datetime :starts_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
