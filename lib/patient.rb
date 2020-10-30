class Patient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(date, doctor)
        appt = Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select {|appt| appt.patient == self}
    end

    def doctors
        docs = []
        appointments.each do |appt|
            if appt.patient == self
                docs << appt.doctor
            end
        end
        docs
    end

    def self.all
        @@all
    end
end