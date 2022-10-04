function scheduleAppointment(address _patient, address _doctor, uint _appointmentDateTime) {
    appointmentsList[_patient][_doctor][_appointmentDateTime].appointmentStatus    = 1;
}
