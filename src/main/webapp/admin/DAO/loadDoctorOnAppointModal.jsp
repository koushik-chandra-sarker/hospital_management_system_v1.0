<%@ page import="DAO.DoctorDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="Entity.AvailableDoctor_all_info" %>
<%@ page import="java.util.List" %>
<%
    String date = request.getParameter("date");
    DoctorDAO doctorDAO = new DoctorDAO(ConnectionProvider.getConnection());
    List<AvailableDoctor_all_info> doctorAllInfo = doctorDAO.getAllAvailableDoctorFullInfo(date);

%>
<div class="mb-3">
    <label for="InputDoctorAppointPatient" class="form-label">Department</label>
    <select 
            onchange="setTimeAndLimit()"
            name="appoint_patient_doctor" id="InputDoctorAppointPatient" class="form-select" aria-label="Department">
        <option selected></option>
        <%
            for (AvailableDoctor_all_info ad: doctorAllInfo){

        %>
        <option value="<%=ad.getDoctor_id()%>,<%=ad.getLimit()%>,<%=ad.getStart_time()%>"> <%=ad.getName()%> (<%=ad.getStart_time()%>) </option>
       <%
           }
       %>
    </select>
    <script type="text/javascript">
        function setTimeAndLimit() {
            var doctor = $('#InputDoctorAppointPatient').val().split(",")
            var doctorId = doctor[0]
            var limit = doctor[1]
            var time = doctor[2]
            $('#InputDocIdAppointPatient').val(doctorId)
            $('#InputLimitAppointPatient').val(limit)
            $('#InputTimeAppointPatient').val(time)

        }
    </script>
</div>
<input hidden name="appoint_patient_docId" id="InputDocIdAppointPatient">
<div class="mb-3">
    <label for="InputLimitAppointPatient" class="form-label">Available Token</label>
    <input readonly name="appoint_patient_availability" type="email" class="form-control"
           id="InputLimitAppointPatient"
           aria-describedby="emailHelp">
</div>
<div class="mb-3">
    <label for="InputTimeAppointPatient" class="form-label">Time</label>
    <input readonly name="appoint_patient_time" type="email" class="form-control"
           id="InputTimeAppointPatient"
           aria-describedby="emailHelp">
</div>

<div class="modal-footer">
    <button type="submit" class="btn btn-primary form-control">Add</button>
</div>
