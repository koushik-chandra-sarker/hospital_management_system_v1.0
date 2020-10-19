<%--add patient modal--%>
<div class="modal animate__animated animate__backInDown addPatientModal" id="addPatientModal" tabindex="-1"
     aria-labelledby="addPatientModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="addPatientModalLabel">Add Patient</h5>
                <button type="button" class="btn-close" id="addPatientModalClose" data-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <form id="addPatientByAdmin">
                <div class="modal-body">
                    <div class="row">
                        <div class="col">

                            <div class="mb-3">
                                <label for="InputUsernamePatient" class="form-label ">Username</label>
                                <input name="patient_username" type="text" required
                                       class="form-control usernameStaff is-invalid"
                                       id="InputUsernamePatient" aria-describedby="emailHelp">
                                <div id="validationServerUsernameFeedback" class="invalid-feedback un_feed_staff"
                                     style="display: none">
                                    Username already exists.
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="InputNamePatient" class="form-label ">Name</label>
                                <input name="patient_name" type="text" required class="form-control"
                                       id="InputNamePatient">
                            </div>
                            <div class="mb-3">
                                <label for="InputEmailPatient" class="form-label">Email address</label>
                                <input required name="patient_email" type="email" class="form-control"
                                       id="InputEmailPatient"
                                       aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="InputAddressPatient" class="form-label">Address</label>
                                <textarea name="patient_address" type="text" class="form-control"
                                          id="InputAddressPatient"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="InputPhonePatient" class="form-label">Phone No</label>
                                <input required name="patient_phone" type="number" class="form-control"
                                       id="InputPhonePatient"
                                >
                            </div>
                            <div class="mb-3">
                                <label for="InputAgePatient" class="form-label">Age</label>
                                <input required name="patient_age" type="number" class="form-control"
                                       id="InputAgePatient"
                                >
                            </div>

                            <div class="mb-3">
                                <label class="form-label col-12">Gender</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="patient_gender" id="patientSexRadio1"
                                           value="MALE">
                                    <label class="form-check-label" for="patientSexRadio1">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="patient_gender" id="patientSexRadio2"
                                           value="FEMALE">
                                    <label class="form-check-label" for="patientSexRadio2">Female</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="patient_gender" id="patientSexRadio3"
                                           value="OTHER">
                                    <label class="form-check-label" for="patientSexRadio3">Other</label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary form-control">Add</button>
                </div>
            </form>


        </div>
    </div>
</div>


<div class="modal animate__animated animate__backInDown editPatientModal" id="editPatientModal" tabindex="-1"
     aria-labelledby="editPatientModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Update Patient</h5>
                <button type="button" class="btn-close" id="editPatientModalClose" data-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <form id="editPatientByAdmin" action="" method="post" enctype="multipart/form-data">

            </form>
        </div>
    </div>
</div>


<%--Patient's Appointment modal--%>
<div class="modal animate__animated animate__backInDown editPatientModal" id="appointPatientModal" tabindex="-1"
     aria-labelledby="appointPatientModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content container-fluid">
            <div class="modal-header">
                <h5 class="modal-title" id="appointModalLabel">Update Patient</h5>
                <button type="button" class="btn-close" id="appointPatientModalClose" data-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <form id="appointPatientByAdmin">
                <div class="mb-3">
                    <label for="InputPatientIdAppointPatient" class="form-label">Patient Id</label>
                    <input required name="appoint_patient_id" type="number" class="form-control"
                           id="InputPatientIdAppointPatient"
                    >
                </div>
                <div class="row">
                    <div class="col-10">
                        <div class="mb-3">
                            <input
                                    name="appoint_patient_date"
                                    type="text" class="form-control"
                                    placeholder="Select date..." id="appointment_date">

                            <script type="text/javascript">
                                $('#appointment_date').dateTimePicker();

                            </script>
                        </div>
                    </div>
                    <div class="col-2">
                        <Button type="button" class="btn btn btn-outline-info form-control" onclick="setDoctorOnAppointModal()"><i class="fas fa-arrow-circle-down"></i></Button>
                    </div>
                </div>
                <div id="appoint_doctor">
<%--                    See loadDoctorOnAppointModal.jsp--%>
                </div>



            </form>
        </div>
    </div>
</div>

