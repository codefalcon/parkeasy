class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.text :address
      t.integer :proof_type_id
      t.string :proof_id
      t.boolean :is_admin
      t.boolean :is_trusted
      t.references :user

      t.timestamps
    end
    add_index :user_infos, :user_id
  end
end
