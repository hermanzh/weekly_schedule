class UserMailer < ApplicationMailer
  default from: 'langxing386@163.com'

  def scheduled_mail
    time = Date.today.beginning_of_week.beginning_of_day
    @schedule = Schedule.find_by_begin_at(time)
    @weeks = Goal.day_of_weeks.keys
    mail(to: 'longxing386@163.com', subject: "周计划(#{Date.today.beginning_of_week})")
    #christa_cao@aseglobal.com
  end
end