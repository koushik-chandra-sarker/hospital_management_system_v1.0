<%@ page import="DAO.DoctorDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="Entity.Doctor" %>
<%
    int id = Integer.parseInt(request.getParameter("docId"));
    DoctorDAO doctorDAO = new DoctorDAO(ConnectionProvider.getConnection());

    Doctor doctor = doctorDAO.getDoctorById(id);
%>



<div class="modal-body">
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="EditId" class="form-label ">Id</label>
                <input name="doc_id" type="text" readonly class="form-control" value="<%=doctor.getId()%>"
                       id="EditId">
            </div>
            <div class="mb-3">
                <label for="EditName" class="form-label ">Name</label>
                <input name="doc_name" type="text" required class="form-control"
                       id="EditName" value="<%=doctor.getName()%>">
            </div>
            <div class="mb-3">
                <label for="EditEmail" class="form-label">Email address</label>
                <input required name="doc_email" type="email" class="form-control" id="EditEmail"
                       aria-describedby="emailHelp" value="<%=doctor.getEmail()%>">
            </div>
            <div class="mb-3">
                <label for="EditPhone" class="form-label">Phone No</label>
                <input required name="doc_phone" type="number" class="form-control" id="EditPhone"
                       value="<%=doctor.getPhone_no()%>"
                >
            </div>
            <div class="mb-3">
                <label for="EditSpeciality" class="form-label">Speciality</label>
                <input name="doc_speciality" type="text" class="form-control" id="EditSpeciality"
                       value="<%=doctor.getSpeciality()%>"
                >
            </div>

            <div class="mb-3">
                <label for="EditQualification" class="form-label">Qualification</label>
                <textarea name="doc_qualification" type="text" class="form-control"
                          id="EditQualification"><%=doctor.getQualification()%></textarea>
            </div>

            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox"  id="editUserInfo">
                <label class="form-check-label" for="editUserInfo">Show User info</label>
            </div>
            <%-- User Info--%>
            <div class="user_info">
                <div class="mb-3">
                    <label for="EditUsername" class="form-label ">Username</label>
                    <input name="doc_username" type="text" readonly
                           class="form-control"
                           id="EditUsername" aria-describedby="emailHelp"
                           value="<%=doctor.getUser().getUsername()%>"
                    >
                </div>
                <div class="mb-3">
                    <label for="EditPassword" class="form-label ">Password</label>
                    <input name="doc_password" type="text"
                           class="form-control"
                           id="EditPassword" aria-describedby="emailHelp"
                           value="<%=doctor.getUser().getPassword()%>"
                    >

                </div>
                <div class="mb-3">
                    <label for="EditRole" class="form-label ">Role</label>
                    <input name="doc_role" type="text" readonly
                           class="form-control"
                           id="EditRole" aria-describedby="emailHelp"
                           value="<%=doctor.getUser().getRole()%>"
                    >

                </div>
                <div class="form-check form-switch">
                    <%
                        if (doctor.getUser().isActive()){
                    %>
                    <input class="form-check-input" name="doc_active" type="checkbox" checked id="ActiveStatus"
                           value="<%=doctor.getUser().isActive()%>"
                    >
                    <%
                        }else {
                    %>
                    <input class="form-check-input" name="doc_active" type="checkbox" id="ActiveStatus"
                           value="<%=doctor.getUser().isActive()%>"
                    >
                    <%
                        }
                    %>
                    <label class="form-check-label" for="ActiveStatus">Active Status</label>
                </div>

            </div>

        </div>
    </div>
</div>
<div class="modal-footer">
    <button id="update_doc_btn" type="submit" class="btn btn-primary">Update</button>
</div>


<script>
    $(document).ready(function () {
        $('#editUserInfo').click(function () {
            let checkBox = this.checked;
            console.log(checkBox)
            if (checkBox===true){
                $('.user_info').addClass('user_info_Show')
            }
            else {
                $('.user_info').removeClass('user_info_Show')
            }
        })
    })
</script>