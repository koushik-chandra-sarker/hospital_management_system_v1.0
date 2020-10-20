<%@ page import="DAO.DoctorDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.Doctor" %>

<%
    DoctorDAO doctorDAO = new DoctorDAO(ConnectionProvider.getConnection());
    List<Doctor> doctors = doctorDAO.getAllDoctor();
    for (Doctor doctor : doctors) {
%>
<tr
        onclick="openDocProfileModal(<%=doctor.getId()%>)"
        class="doc_table_row"
        data-toggle="modal"
        data-placement="bottom" title="Click to View Profile"

>
    <td data-label="Id"><%=doctor.getId()%>
    </td>
    <td data-label="Name"><%=doctor.getName()%>
    </td>
    <td data-label="Email"><%=doctor.getEmail()%>
    </td>
    <td data-label="Phone No"><%=doctor.getPhone_no()%>
    </td>
    <td data-label="Speciality"><%=doctor.getSpeciality()%>
    </td>
    <td data-label="Username"><%=doctor.getUser().getUsername()%>
    </td>
    <td data-label="Action">
        <div class="row">
            <div class="col-sm-6 col-lg-12 col-xl-6 g-2 d-flex justify-content-center">
                <Button
                        onclick="setDataOnUpdateDoctorModal(<%=doctor.getId()%>)"
                        class="btn doc_add_btn"
                        aria-label="Edit Doctor"
                        data-toggle="modal"
                        data-placement="left"
                        title="Add Doctor"
                        type="button"
                        data-target="#editDoctorModal"
                >
                    <i class="far fa-edit" style="font-size: 15px;"></i>
                </Button>
            </div>
            <div class="col-sm-6 col-lg-12 col-xl-6 d-flex justify-content-center g-2">
                <Button
                        onclick="deleteDoctor(<%=doctor.getId()%>)"
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


<script>

    function openDocProfileModal(docId) {

        $.ajax({
            data:{docId:docId},
            url: "DAO/getDoctorForProfileByAdmin.jsp",
            success:function (data) {
                $("#doc_profile_modal_admin").html(data);

            }
        })
        $('.doc_table_row').attr("data-target","#DoctorProfileModal")

    }

</script>