<%@ page import="DAO.AppointmentDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="Entity.Appointment" %>
<%
    AppointmentDAO appointmentDAO = new AppointmentDAO(ConnectionProvider.getConnection());
    int patientId = Integer.parseInt(request.getParameter("patient_id"));
    Appointment appointment = appointmentDAO.getAppointmentByPatientId(patientId);
%>


<div class="row">
    <div class="col-12 doc_avail_card showAppointment_card mt-4">
        <div class="d_card position-relative ">
            <div class="avail_title">
                <h5>Patient Information</h5>
            </div>
            <div class="container-fluid">
                <div class="row mb-3">
                    <div class="col-12 g-3 d-flex justify-content-around">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Id :</b> <%=appointment.getPatient().getId()%></h6>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Name :</b> <%=appointment.getPatient().getName()%></h6>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Phone :</b> <%=appointment.getPatient().getPhone_no()%></h6>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Email Address :</b> <%=appointment.getPatient().getEmail()%></h6>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Age :</b> <%=appointment.getPatient().getAge()%></h6>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Gender :</b> <%=appointment.getPatient().getSex()%></h6>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Username :</b> <%=appointment.getPatient().getUser().getUsername()%></h6>
                                </div>
                                <div class="col-lg-3 col-md-7 col-6 g-3">
                                    <h6><b>Address :</b> <%=appointment.getPatient().getAddress()%></h6>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class=" avail_title avail_footer">
                <h5 style="font-size: 1.25rem">Doctor's information</h5>
            </div>
            <div class="container-fluid">
                <div class="row pb-3">
                    <div class="col-12 g-3 d-flex justify-content-around">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Name :</b><%=appointment.getDoctor().getName()%></h6>
                                </div>

                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Email Address :</b> <%=appointment.getDoctor().getEmail()%></h6>
                                </div>

                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Phone :</b> <%=appointment.getDoctor().getPhone_no()%></h6>
                                </div>
                                <div class="col-lg-3 col-md-4 col-6 g-3">
                                    <h6><b>Speciality :</b> <%=appointment.getDoctor().getSpeciality()%> 1</h6>
                                </div>
                                <div class="col-lg-12 col-md-8 col-12 g-3">
                                    <h6><b>Qualification :</b> <%=appointment.getDoctor().getQualification()%></h6>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class=" avail_title avail_footer">
                <h5 style="font-size: 1.25rem">Appointment's information</h5>
            </div>
            <div class="container-fluid">
                <div class="row pb-3">
                    <div class="col-12 g-3 d-flex justify-content-around">

                        <div>
                            <h6><b>Date :</b> <%=appointment.getDate()%></h6>
                        </div>

                        <div>
                            <h6><b>Time :</b> <%=appointment.getTime()%></h6>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>