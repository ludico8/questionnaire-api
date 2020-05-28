class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :label
      t.boolean :active

      t.timestamps
    end
  end
end
