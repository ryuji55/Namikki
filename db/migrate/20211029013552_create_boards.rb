class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :point
      t.string :wave_size
      t.text :body
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
