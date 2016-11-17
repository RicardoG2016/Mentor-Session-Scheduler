class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new
    @appointment.topic = params[:appointment][:topic]
    @appointment.start_time = @appointment.generate_start_time(params)
    @appointment.end_time = @appointment.generate_end_time(params)
    @appointment.interval = params[:appointment][:interval].to_i
    @appointment.available = true
    @appointment.mentor = current_user
    if @appointment.save
      redirect_to "/"
    else
      render "new"
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    @appointment = Appointments.find(params[:id])
    @appointment.available = true
    @appointment.student_id = nil
    @appointment.save
    if @appointment.save
      redirect_to 'users/show'
    else
      flash[:notice] = "Post successfully created"
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    Appointment.find(params[:id]).destroy
    render 'users/show'
  end

end
