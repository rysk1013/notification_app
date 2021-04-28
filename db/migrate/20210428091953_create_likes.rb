class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foregin_key: true
      t.references :post, foregin_key: true
      t.timestamps
    end
  end
end
