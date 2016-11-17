class Appointment < ApplicationRecord
	belongs_to :mentor, class_name: "User"
	belongs_to :student, class_name: "User", optional: true
	validates :start_time, presence: true
	validates :topic, presence: true
	validates :interval, presence: true

	def generate_start_time(params)
		date = params[:date].split('/')
		year = date[2].to_i
		month = date[0].to_i
		day = date[1].to_i
		time = params[:start_time].split(':')
		if time[1][-2..-1].downcase == 'pm'
			hour = time[0].to_i + 12
		elsif time[1][-2..-1].downcase == 'am'
			hour = time[0].to_i
		else
			nil
		end
		time[1].slice!(-2..-1)
		minute = time[1].to_i
		DateTime.new(year, month, day, hour, minute)
	end

	def generate_end_time(params)
		start_time = self.generate_start_time(params)
		start_time + params[:appointment][:interval].to_i.minutes
	end
end
