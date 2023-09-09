class CreateUserConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :user_connections do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :follower, null: false, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
