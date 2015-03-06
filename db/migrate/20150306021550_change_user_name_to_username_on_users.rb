class ChangeUserNameToUsernameOnUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :user_name
      t.string :username
    end
  end
end
