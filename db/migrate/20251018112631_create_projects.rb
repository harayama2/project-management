class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.belongs_to :owner
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
