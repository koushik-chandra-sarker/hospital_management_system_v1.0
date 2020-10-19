
<%@include file="patientModal.jsp" %>


<div class="patient animate__animated animate__zoomIn" style="display: none">
    <div class="row">
        <div class="col-12 g-4">
            <div class="col d-flex justify-content-between">
                <h4 class="doc_header">Patients</h4>
                <Button

                        class="btn doc_add_btn"
                        aria-label="Add Staff"
                        data-toggle="modal"
                        data-placement="left"
                        title="Add Staff"
                        type="button"
                        data-target="#addPatientModal"
                >
                    <i class="fas fa-plus"></i>
                </Button>
            </div>
        </div>
        <div class=" col-md-6 col-12 mb-2 mt-2 patient_datePicker">
            <input type="text" class="form-control" id="search_patient_by_appointment_date" placeholder="Search by Appointment date...">

            <script type="text/javascript">
                var d = new Date().toISOString().split('T')[0]
                $('#search_patient_by_appointment_date').dateTimePicker();
            </script>
        </div>
        <div class=" col-md-6 col-12 mb-2 mt-2 patient_datePicker">
            <input
                    onkeyup="searchPatientByAny()"
                    type="text" class="form-control" id="search_patient_by_any" placeholder="Search By Any...">

        </div>

        <div class="col-12">
            <div class="table_header">
                <h5>List of Patient</h5>
            </div>
        </div>
        <div class="col-12 g-3">
            <div class="d_card position-relative d_card_table patient_card_table ">
                <div class="table_container">
                    <div class="table_main">
                        <table>
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone No</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Username</th>
                                <th>Action</th>

                            </tr>

                            </thead>

                            <tbody id="a_patient_tableBody">
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>