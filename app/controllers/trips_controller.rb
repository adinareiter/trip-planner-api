class TripsController < ApplicationController
  def index
    @trips = Trip.all
    render :index
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render :show
  end

  def create
    @trip = Trip.create(
      user_id: nil,
      title: params[:title],
      image_url: params[:image_url],
      start_time: params[:start_time],
      end_time: params[:end_time],
    )
    if @trip.valid?
      render :show
    else
      render json: { errors: @trip.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    @trip.update(
      user_id: nil,
      title: params[:title] || @trip.title,
      image_url: params[:image_url] || @trip.image_url,
      start_time: params[:start_time] || @trip.start_time,
      end_time: params[:end_time] || @trip.end_time,
    )
    render :show
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy
    render json: { message: "item successfully deleted" }
  end
end
