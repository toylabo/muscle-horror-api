class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.string :name
      t.integer :score
      t.integer :muscle
      t.integer :speed
      t.integer :affinity
      t.integer :exploratory
      t.integer :life

      t.timestamps
    end
  end
end
