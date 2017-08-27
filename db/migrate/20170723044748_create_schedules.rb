class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :name, null: false, default: ''
      t.boolean :is_achieved, null: false, default: false
      t.string :comment
      t.datetime :begin_at, index: true
      t.datetime :end_at, index: true
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
