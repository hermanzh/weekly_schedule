ActiveAdmin.register Schedule do

  actions :all
  permit_params :name, :begin_at, :end_at, :is_achieved, :comment

  action_item :view, only: :show do
    link_to '预览', schedule_view_path(:id)
  end

  index do
    column :name
    column :begin_at
    column :end_at do |f|
      f.begin_at.sunday
    end
    column :is_achieved
    column :comment
    actions
  end

  filter :name
  filter :is_achieved
  filter :begin_at
  filter :end_at

  show do
    attributes_table do
      row :name
      row :begin_at
      row :end_at do |f|
        f.begin_at.sunday
      end
      row :is_achieved
      row :comment
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :begin_at, as: :datepicker,
              datepicker_options: {
                  min_date: Date.today.next_week
              }
      f.input :is_achieved
      f.input :comment
    end
    f.actions
  end

end
