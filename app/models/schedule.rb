# == Schema Information
#
# Table name: schedules
#
#  id          :integer          not null, primary key
#  name        :string           default(""), not null
#  is_achieved :boolean          default("f"), not null
#  comment     :string
#  begin_at    :datetime
#  end_at      :datetime
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_schedules_on_begin_at    (begin_at)
#  index_schedules_on_deleted_at  (deleted_at)
#  index_schedules_on_end_at      (end_at)
#

class Schedule < ApplicationRecord
  acts_as_paranoid

  has_many :goals
end
