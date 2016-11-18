module AppointmentsHelper
	def display_datetime(appt)
		local_time( (appt.start_time.to_time - 6.hours).to_datetime )
	end

	def filter_past_appointments(appointments)
		appointments.each do |appt|
			if appt.start_time < DateTime.now && appt.available
				appt.available = false
				appt.save
			end
		end
	end

	def past_appointment?(appt)

	end
end
