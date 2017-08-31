ActiveAdmin.register Goal do
  permit_params :role, :achieve_goals, :details, :is_achieved, :schedule_id, :day_of_week

  index do
    column :role
    column :achieve_goals
    column :details
    column :is_achieved
    column :day_of_week
    actions
  end

  filter :role
  filter :goals
  filter :is_achieved

  show do
    attributes_table do
      row :role
      row :achieve_goals
      row :details
      row :is_achieved
      row :day_of_week
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :role
      f.input :achieve_goals
      f.input :details
      f.input :is_achieved
      f.input :schedule, as: :select
      f.input :day_of_week, as: :select
    end
    f.actions
  end
end