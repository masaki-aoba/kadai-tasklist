class AddUserRefToTasks < ActiveRecord::Migration[5.2]
  def change
    # tasksテーブルにuser_idというカラムを追加している
    # add_column :tasks, :user_id, :integer とほぼ同じ
    add_reference :tasks, :user, foreign_key: true
  end
end
