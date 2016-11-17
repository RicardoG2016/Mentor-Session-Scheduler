class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :topic
      t.boolean :available, default: true
      t.time :start_time
      t.time :end_time
      t.integer :interval
      t.integer :mentor_id
      t.integer :student_id

    end
  end
end
