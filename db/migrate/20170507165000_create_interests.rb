class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :description
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
