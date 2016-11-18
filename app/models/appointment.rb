class Appointment < ApplicationRecord
	belongs_to :mentor, class_name: "User"
	belongs_to :student, class_name: "User", optional: true
	validate :scheduled_in_the_future
	validates :start_time, presence: true
	validates :topic, presence: true
	validates :interval, presence: true
	has_many :reviews

	def scheduled_in_the_future
		if start_time.past?
			errors.add(:start_time, "Scheduled start time can not be in the past.")
		end
	end

	def verify_datetime(params)
		if ( /\d{2}.\d{2}.\d{4}/.match(params[:date]) ) == nil
			return false
		elsif params[:date].count('/') != 2
			return false
		elsif params[:start_time].count(":") != 1
			return false
		elsif params[:start_time].split(":").length != 2
			return false
		elsif params[:start_time][-2..-1].downcase != "pm" && "am"
			return false
		else
			return true
		end	
	end

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
		end
		time[1].slice!(-2..-1)
		minute = time[1].to_i
		d = DateTime.new(year, month, day, hour, minute)
		(d.to_time + 6.hours).to_datetime

	end

	def generate_end_time(params)
		start_time = self.generate_start_time(params)
		start_time + params[:appointment][:interval].to_i.minutes
	end
end
