class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :tweet, null: false, index: true, foreign_key: true
      t.references :user, null: false, index: true, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
