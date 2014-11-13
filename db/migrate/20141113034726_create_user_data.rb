class CreateUserData < ActiveRecord::Migration
  def change
    create_table :user_data do |t|
      t.integer :uid
      t.text :email
      t.text :nickname
      t.integer :std_id
      t.integer :group_id
      t.integer :admin_group
      t.integer :last_update_time
      t.integer :last_update_ip

      t.timestamps
    end
  end
end
