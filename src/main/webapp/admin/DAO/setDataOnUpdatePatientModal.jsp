
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="Entity.Patient" %>
<%@ page import="DAO.PatientDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("patientId"));
    PatientDAO patientDAO = new PatientDAO(ConnectionProvider.getConnection());
    Patient patient = patientDAO.getPatientById(id);
%>



<div class="modal-body">
    <div class="row">
        <div class="col">
            <input type="text" name="patient_id" value="<%=patient.getId()%>" hidden>
            <div class="mb-3">
                <label for="EditInputUsernamePatient" class="form-label ">Username</label>
                <input name="patient_username" type="text" readonly
                       class="form-control usernamePatient is-invalid"
                       id="EditInputUsernamePatient"
                       value="<%=patient.getUser().getUsername()%>"
                >
            </div>
            <div class="mb-3">
                <label for="EditInputNamePatient" class="form-label ">Name</label>
                <input name="patient_name" type="text" required class="form-control"
                       id="EditInputNamePatient"
                       value="<%=patient.getName()%>"
                >
            </div>
            <div class="mb-3">
                <label for="EditInputEmailPatient" class="form-label">Email address</label>
                <input required name="patient_email" type="email" class="form-control"
                       id="EditInputEmailPatient"
                       value="<%=patient.getEmail()%>"
                >
            </div>
            <div class="mb-3">
                <label for="EditInputAddressPatient" class="form-label">Address</label>
                <textarea name="patient_address" type="text" class="form-control"
                          id="EditInputAddressPatient"><%=patient.getAddress()%></textarea>
            </div>
            <div class="mb-3">
                <label for="EditInputPhonePatient" class="form-label">Phone No</label>
                <input required name="patient_phone" type="number" class="form-control"
                       id="EditInputPhonePatient"
                       value="<%=patient.getPhone_no()%>"
                >
            </div>
            <div class="mb-3">
                <label for="EditInputAgePatient" class="form-label">Age</label>
                <input required name="patient_age" type="number" class="form-control"
                       id="EditInputAgePatient"
                       value="<%=patient.getAge()%>"
                >
            </div>

            <div class="mb-3">
                <%
                    if (patient.getSex().equals("MALE")){
                %>
                <label class="form-label col-12">Gender</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" checked  name="patient_gender"
                           id="EditPatientSexRadio1"
                           value="MALE">
                    <label class="form-check-label" for="EditPatientSexRadio1">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="patient_gender"
                           id="EditPatientSexRadio2"
                           value="FEMALE">
                    <label class="form-check-label" for="EditPatientSexRadio2">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="patient_gender"
                           id="EditPatientSexRadio3"
                           value="OTHER" >
                    <label class="form-check-label" for="EditPatientSexRadio3">Other</label>
                </div>
                <%
                    }else if (patient.getSex().equals("FEMALE")){
                %>

                <label class="form-label col-12">Gender</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio"  name="patient_gender"
                           id="EditPatientSexRadio1"
                           value="MALE">
                    <label class="form-check-label" for="EditPatientSexRadio1">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" checked name="patient_gender"
                           id="EditPatientSexRadio2"
                           value="FEMALE">
                    <label class="form-check-label" for="EditPatientSexRadio2">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="patient_gender"
                           id="EditPatientSexRadio3"
                           value="OTHER" >
                    <label class="form-check-label" for="EditPatientSexRadio3">Other</label>
                </div>
                <%
                }else if (patient.getSex().equals("OTHER")){
                %>

                <label class="form-label col-12">Gender</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio"  name="patient_gender"
                           id="EditPatientSexRadio1"
                           value="MALE">
                    <label class="form-check-label" for="EditPatientSexRadio1">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="patient_gender"
                           id="EditPatientSexRadio2"
                           value="FEMALE">
                    <label class="form-check-label" for="EditPatientSexRadio2">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" checked name="patient_gender"
                           id="EditPatientSexRadio3"
                           value="OTHER" >
                    <label class="form-check-label" for="EditPatientSexRadio3">Other</label>
                </div>
                <%
                    }
                %>
            </div>

        </div>
    </div>
</div>
<div class="modal-footer">
    <button type="submit" class="btn btn-primary form-control">Update</button>
</div>
