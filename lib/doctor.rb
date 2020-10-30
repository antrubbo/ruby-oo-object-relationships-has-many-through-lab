class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def appointments
        Appointment.all.select {|appt| appt.doctor == self}
    end

    def new_appointment(date, patient)
        appt = Appointment.new(date, patient, self)
    end

    def patients
        new_patients = []
        appointments.each do |appt|
            if appt.doctor == self
                new_patients << appt.patient
            end
        end
        new_patients
    end

    def self.all
        @@all
    end
end