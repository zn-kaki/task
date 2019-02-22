class ChangeMemosNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :memos, :name, false
  end
end
