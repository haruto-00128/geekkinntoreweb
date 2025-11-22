class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @diagnoses = @user.diagnoses.order(created_at: :desc)
    start_date = params.fetch(:start_date, Date.today).to_date

    @events = @user.posts
      .where(
        'start_time <= ? AND (end_time >= ? OR end_time IS NULL)',
        start_date.end_of_month.end_of_week,
        start_date.beginning_of_month.beginning_of_week
      )
  end

end
