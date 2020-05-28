class AddDefaultValueToQuestionAttribute < ActiveRecord::Migration[5.0]
  def up
    change_column :questions, :active, :boolean, default: true
  end
  
  def down
    change_column :questions, :active, :boolean, default: nil
  end
end
