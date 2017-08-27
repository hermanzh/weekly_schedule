class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :role, index: true, null: false, default: ''
      t.string :achieve_goals, index:true, null: false, default: ''
      t.text :details
      t.references :schedule
      t.boolean :is_achieved, null: false, default: false
      t.datetime :deleted_at, indext: true
      t.timestamps
    end
  end
end
