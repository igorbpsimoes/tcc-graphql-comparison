class CreateUserConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :user_connections do |t|
      t.bigint :user_id
      t.bigint :follower_id

      t.timestamps
    end
  end
end
