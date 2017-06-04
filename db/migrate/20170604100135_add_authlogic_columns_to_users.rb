class AddAuthlogicColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :crypted_password, :string
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
    add_column :users, :login_count, :string
    add_column :users, :last_request_at, :string
    add_column :users, :last_login_at, :string
    add_column :users, :current_login_at, :string
    add_column :users, :last_login_ip, :string
    add_column :users, :current_login_ip, :string
  end
end