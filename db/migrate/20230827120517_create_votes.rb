class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :voteable, null: false, polymorphic: true, index: true

      t.timestamps
    end
  end
end
