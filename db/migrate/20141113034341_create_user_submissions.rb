class CreateUserSubmissions < ActiveRecord::Migration
  def change
    create_table :user_submission do |t|
      t.integer :link_id
      t.integer :submit_type
      t.integer :submit_content
      t.integer :judge_result
      t.integer :usage_time
      t.integer :usage_mem
      t.integer :usage_file
      t.integer :submit_user
      t.integer :submit_time
      t.text :submit_ip

      t.timestamps
    end
  end
end
