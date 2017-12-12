class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column "name", :string, :limit => 25
      t.boolean "admin_user", :default =>false
      t.string "email", :default => '', :null => false
      t.string "password", :limit => 40
      t.string "qualification"
      t.string "college"
      t.string "stream"
      t.string "phone"
      t.timestamps
    end
  end
end
