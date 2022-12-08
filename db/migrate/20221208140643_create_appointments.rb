class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :email
      t.string :appointment_date
      t.string :appointment_time

      t.timestamps
    end
  end
end
