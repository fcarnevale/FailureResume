class ChangeLessonToTextInFailures < ActiveRecord::Migration
  def change
    change_column :failures, :lesson, :text
  end
end
