require_relative "./appointment"

class Doctor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select{|appointment| appointment.doctor == self}
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def patients
        self.appointments.map{|appointment| appointment.patient}
    end
end