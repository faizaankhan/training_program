class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.boolean :admin_user, default: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :qualification
      t.string :college
      t.string :stream
      t.string :phone
      t.timestamps
    end
  end
end
