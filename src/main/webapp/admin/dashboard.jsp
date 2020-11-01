<%@ page import="DAO.PatientDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="DAO.DoctorDAO" %>
<%@ page import="DAO.StaffDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="Entity.AvailableDoctor_all_info" %>
<%
    DoctorDAO doctorDAO = new DoctorDAO(ConnectionProvider.getConnection());
    int totalDoctor = doctorDAO.doctorCount();
    StaffDAO staffDAO = new StaffDAO(ConnectionProvider.getConnection());
    int totalStaff = staffDAO.staffCount();
    PatientDAO patientDAO = new PatientDAO(ConnectionProvider.getConnection());
    int todayTotalPatient = patientDAO.todayPatientCount();
%>


<div class="dashboard content_active animate__animated animate__zoomInUp" style="display: none">
    <div class="row">

        <div class="col-lg-4 col-md-6 col-12 g-4">
            <div class="d_card position-relative">
                <div class="row">
                    <div class="col-8">
                        <div class="d_card_header">
                            <h5>Total Doctor</h5>
                        </div>
                        <div class="d_card_title">
                            <p><%=totalDoctor%></p>
                        </div>
                    </div>
                    <div class="col-4">
                        <img src="../resource/icons/doctor.svg" alt="" class="d_card_icon">
                    </div>
                </div>

                <div class=" col-12 d-flex justify-content-center align-items-center d_card_action position-absolute">
                    <a href="#">More info...</a>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6 col-12 g-4">
            <div class="d_card position-relative">
                <div class="row">
                    <div class="col-8">
                        <div class="d_card_header">
                            <h5>Total Staff</h5>
                        </div>
                        <div class="d_card_title">
                            <p><%=totalStaff%></p>
                        </div>
                    </div>
                    <div class="col-4">
                        <img src="../resource/icons/staff.svg" alt="" class="d_card_icon">
                    </div>
                </div>

                <div class=" col-12 d-flex justify-content-center align-items-center d_card_action position-absolute">
                    <a href="#">More info...</a>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-12 g-4">
            <div class="d_card position-relative">
                <div class="row">
                    <div class="col-8">
                        <div class="d_card_header">
                            <h5>Today's Total Patient</h5>
                        </div>
                        <div class="d_card_title">
                            <p><%=todayTotalPatient%></p>
                        </div>
                    </div>
                    <div class="col-4">
                        <img src="../resource/icons/patient.svg" alt="" class="d_card_icon">
                    </div>
                </div>

                <div class=" col-12 d-flex justify-content-center align-items-center d_card_action position-absolute">
                    <a href="#">More info...</a>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="table_header dash_t_h">
                <h5>Today's Available Doctors</h5>
            </div>
        </div>
        <div class="col-12 g-3">
            <div class="d_card position-relative d_card_table">
                <div class="table_main">
                    <table>
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Phone No</th>
                            <th>Speciality</th>
                            <th>Time</th>
                            <th>Room</th>
                            <th>Limit</th>
                        </tr>

                        </thead>

                        <tbody>
                        <%
                            DoctorDAO doctorDAO1 = new DoctorDAO(ConnectionProvider.getConnection());
                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                            String today = df.format(new Date());
                            List<AvailableDoctor_all_info> doctors = doctorDAO1.getAllAvailableDoctorFullInfo(today);
                            for (AvailableDoctor_all_info doctor : doctors) {
                        %>
                        <tr
                                onclick="openDocProfileModal(<%=doctor.getDoctor_id()%>)"
                                class="doc_table_row"
                                data-toggle="modal"
                                data-placement="bottom" title="Click to View Profile"

                        >
                            <td data-label="Id"><%=doctor.getDoctor_id()%>
                            </td>
                            <td data-label="Name"><%=doctor.getName()%></td>
                            <td data-label="Phone No"><%=doctor.getPhone_no()%></td>
                            <td data-label="Speciality"><%=doctor.getSpeciality()%></td>
                            <td data-label="Time"><%=doctor.getStart_time()%> - <%=doctor.getEnd_time()%></td>
                            <td data-label="Room"><%=doctor.getRoom()%></td>
                            <td data-label="Limit"><%=doctor.getLimit()%></td>
                        </tr>
                        <%
                            }
                        %>


                        </tbody>

                    </table>

                </div>
            </div>
        </div>
    </div>
</div>