class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.integer "gameID"
      t.integer "playerID"
      t.integer "score"
      t.integer "ranking"
    end
  end
end
