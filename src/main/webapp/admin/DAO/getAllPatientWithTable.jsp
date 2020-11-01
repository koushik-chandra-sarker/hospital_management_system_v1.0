<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.PatientDAO" %>
<%@ page import="Entity.Patient" %>


<%
    PatientDAO patientDAO = new PatientDAO(ConnectionProvider.getConnection());
    List<Patient> patients = patientDAO.getAllPatient();
    for (Patient patient : patients) {
%>
<tr
        onclick="AppointmentDetailsModal(<%=patient.getId()%>)"
        class="patient_table_row"
        data-toggle="modal"
        data-placement="bottom" title="Click to give or show Appointment"

>

    <td data-label="Id"><%=patient.getId()%>
    </td>
    <td data-label="Name"><%=patient.getName()%>
    </td>
    <td data-label="Email"><%=patient.getEmail()%>
    </td>
    <td data-label="Phone No"><%=patient.getPhone_no()%>
    </td>
    <td data-label="Age"><%=patient.getAge()%>
    </td>
    <td data-label="Sex"><%=patient.getSex()%>
    </td>
    <td data-label="Username"><%=patient.getUser().getUsername()%>
    </td>
    <td data-label="Action">
        <div class="row">
            <div class="col-sm-6 col-lg-12 col-xl-6 g-2 d-flex justify-content-center">
                <Button
                        onclick="setDataOnUpdatePatientModal(<%=patient.getId()%>)"
                        class="btn doc_add_btn"
                        aria-label="Edit Doctor"
                        data-toggle="modal"
                        data-placement="left"
                        title="Add Doctor"
                        type="button"
                        data-target="#editPatientModal"
                >
                    <i class="far fa-edit" style="font-size: 15px;"></i>
                </Button>
            </div>
            <div class="col-sm-6 col-lg-12 col-xl-6 d-flex justify-content-center g-2">
                <Button
                        onclick="deletePatient(`<%=patient.getId()%>`, `<%=patient.getUser().getUsername()%>`)"
                        class="btn doc_add_btn"
                        aria-label="Add Doctor"
                        data-toggle="tooltip"
                        data-placement="left"
                        title="Add Doctor"
                        type="button"
                >
                    <i class="fas fa-trash" style="font-size: 15px; color: #c16262"></i>
                </Button>
            </div>
        </div>


    </td>
</tr>
<%
    }
%>

