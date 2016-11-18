module AppointmentsHelper
	def display_datetime(appt)
		local_time(appt.start_time)
	end
end
