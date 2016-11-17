module AppointmentsHelper
	def display_datetime(appt)
		i = local_time(appt.start_time)
	end
end
