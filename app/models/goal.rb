# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  role          :string           default(""), not null
#  achieve_goals :string           default(""), not null
#  details       :text
#  schedule_id   :integer
#  is_achieved   :boolean          default("f"), not null
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_goals_on_achieve_goals  (achieve_goals)
#  index_goals_on_role           (role)
#  index_goals_on_schedule_id    (schedule_id)
#

class Goal < ApplicationRecord
  acts_as_paranoid

  enum day_of_week: { Monday: 0, Tuesday: 1, Wednesday: 2, Thursday: 3, Friday: 4, Saturday: 5, Sunday: 6 }
  belongs_to :schedule, dependent: :destroy

  scope :is_today, -> (day) {
    where(day_of_week: day)
  }
end
