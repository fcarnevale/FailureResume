class CreateFailures < ActiveRecord::Migration
  def change
    create_table :failures do |t|
      t.integer :resume_id
      t.string :description
      t.string :lesson
      t.timestamps
    end
  end
end
