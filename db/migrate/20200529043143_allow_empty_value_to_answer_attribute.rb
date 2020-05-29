class AllowEmptyValueToAnswerAttribute < ActiveRecord::Migration[5.0]
  def up
    change_column :answers, :answer, :string, :null => true
  end
  
  def down
    change_column :answers, :answer, :string, :null => false
  end
end
