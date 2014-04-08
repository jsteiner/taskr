class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :list, index: true, null: false

      t.timestamps
    end
  end
end
