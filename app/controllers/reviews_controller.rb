class ReviewsController < ApplicationController

def new
  @review = Review.new
end

def create
  @appointment = Appointment.find(params[:id])
  @review = Review.new
  @review.comment = params[:comment]
  @review.rating = params[:rating]
  @review.user = current_user
  @review.appointment = @appointment
  if @review.save
    redirect '/users/show'
  else
    @error = "Please enter a valid input"
    render 'new'
  end
end

end
