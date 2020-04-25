class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
        t.references :user, null: false, foreign_key: true
        t.references :rater, null: false
        t.integer :rating
        t.datetime :rated_at

        t.timestamps
    end
  end
end
