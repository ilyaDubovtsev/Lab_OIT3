class ActivitiesController < ApplicationController
  def add_a_fake_user
    activity = Activity.new({:ip_addr => "123.123.0.0"})
    activity.save
    redirect_to root_path
  end
end
