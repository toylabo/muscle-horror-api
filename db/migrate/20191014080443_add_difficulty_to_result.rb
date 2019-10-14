class AddDifficultyToResult < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :difficulty, :string
  end
end
