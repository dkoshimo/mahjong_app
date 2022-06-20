class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer "uma"
      t.integer "rate"
      t.integer "tip"
      end
  end
end
