class AppointmentsController < ApplicationController
  include AppointmentsHelper
  # GET /appointments
  # GET /appointments.json

  def home
  end 

  def signup
    redirect_to(new_user_session_path) and return if !current_user
    appt = Appointment.find(params[:id])
    if appt.mentor != current_user
      appt.available = false
      appt.student = current_user
      appt.save
    end
    redirect_to("/appointments/index")
  end 

  def index
    redirect_to(new_user_session_path) and return if !current_user
    filter_past_appointments(Appointment.all)
    @appointments = Appointment.where(available: true)
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    redirect_to(new_user_session_path) and return if !current_user
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new
    if @appointment.verify_datetime(params) == false
      @error = "Please enter a valid date and time."
      render('new') and return
    else
      @appointment.topic = params[:appointment][:topic]
      @appointment.start_time = @appointment.generate_start_time(params)
      @appointment.end_time = @appointment.generate_end_time(params)
      @appointment.interval = params[:appointment][:interval].to_i
      @appointment.available = true
      @appointment.mentor = current_user
      if @appointment.save
        redirect_to "/appointments/index"
      else
        render "new"
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])
    @appointment.available = true
    @appointment.student_id = nil
    @appointment.save
    if @appointment.save
      redirect_to :back and return
    else
      flash[:notice] = "Post successfully created"
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to :back
  end

end
