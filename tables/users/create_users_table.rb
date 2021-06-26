require './connect_db.rb'
connect_db!

ActiveRecord::Migration.create_table(:users) do |t|
    t.string :name
    t.string :email
    t.string :password
end