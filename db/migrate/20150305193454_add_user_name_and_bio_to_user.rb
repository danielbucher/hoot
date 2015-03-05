class AddUserNameAndBioToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name
      t.string :user_name
      t.text :bio
    end
  end
end
