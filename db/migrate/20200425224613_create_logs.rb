class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :description
      t.string :type_of
      t.integer :github_event_id
      t.datetime :posted_at
      t.decimal :rating
      t.references :loggable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
