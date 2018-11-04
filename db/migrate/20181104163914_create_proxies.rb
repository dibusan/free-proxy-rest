class CreateProxies < ActiveRecord::Migration[5.2]
  def change
    create_table :proxies do |t|
      t.string :ip
      t.integer :port
      t.string :code
      t.string :country
      t.string :anonymity
      t.boolean :google
      t.boolean :https
      t.string :last_checked

      t.timestamps
    end
  end
end
