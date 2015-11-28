class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
    @header = "Add A New Activity"
    @action = "create"
    @method = :post
  end

  def edit
    @activity = Activity.find(params[:id])
    @header = "Edit Activity"
    @action = "update"
    @method = :patch
    render "new"
  end

  def create
    stop = Stop.find(params[:stop_id])
    stop.activities.create(activity_params)
    redirect_to trip_stop_path(stop.trip_id, stop.id)
  end

  def update
    stop = Stop.find(params[:stop_id])
    activity = stop.activities.find(params[:id])
    activity.update(activity_params)
    redirect_to trip_stop_path(stop.trip_id, stop.id)
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end

end
