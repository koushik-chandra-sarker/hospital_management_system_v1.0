
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="DAO.StaffDAO" %>
<%@ page import="Entity.Staff" %>
<%
    int id = Integer.parseInt(request.getParameter("staffId"));
    StaffDAO staffDAO = new StaffDAO(ConnectionProvider.getConnection());

    Staff staff = staffDAO.getStaffById(id);
%>



<div class="modal-body">
    <div class="row">
        <div class="col">
            <div class="mb-3">
                <label for="EditStaffId" class="form-label ">Id</label>
                <input name="staff_id" type="text" readonly class="form-control" value="<%=staff.getId()%>"
                       id="EditStaffId">
            </div>
            <div class="mb-3">
                <label for="EditStaffName" class="form-label ">Name</label>
                <input name="staff_name" type="text" required class="form-control"
                       id="EditStaffName" value="<%=staff.getName()%>">
            </div>
            <div class="mb-3">
                <label for="EditStaffEmail" class="form-label">Email address</label>
                <input required name="staff_email" type="email" class="form-control" id="EditStaffEmail"
                       aria-describedby="emailHelp" value="<%=staff.getEmail()%>">
            </div>

            <div class="mb-3">
                <label for="EditStaffAddress" class="form-label">Address</label>
                <textarea name="staff_address" type="text" class="form-control"
                          id="EditStaffAddress"></textarea>
            </div>
            <div class="mb-3">
                <label for="EditStaffPhone" class="form-label">Phone No</label>
                <input required name="staff_phone" type="number" class="form-control" id="EditStaffPhone"
                       value="<%=staff.getPhone_no()%>"
                >
            </div>
            <div class="mb-3">
                <label for="EditStaffSalary" class="form-label">Salary</label>
                <input required name="staff_salary" type="number" class="form-control" id="EditStaffSalary"
                >
            </div>
            <div class="mb-3">
                <label for="EditStaffDepartment" class="form-label">Department</label>
                <select name="staff_department" id="EditStaffDepartment" class="form-select" aria-label="Department">
                    <option selected></option>
                    <option value="Department1">Department1</option>
                    <option value="Department2">Department2</option>
                    <option value="Department3">Department3</option>
                </select>
            </div>



            <div class="mb-3">
                <label class="form-label col-12">Gender</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input"  type="radio" name="staff_gender" id="EditStaffRadio1" value="MALE">
                    <label class="form-check-label" for="EditStaffRadio1">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="staff_gender" id="EditStaffRadio2" value="FEMALE">
                    <label class="form-check-label" for="EditStaffRadio2">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="staff_gender" id="EditStaffRadio3" value="OTHER">
                    <label class="form-check-label" for="EditStaffRadio3">Other</label>
                </div>
            </div>


            <%--######################### User Info ############################--%>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox"  id="EditStaffUserInfo">
                <label class="form-check-label" for="EditStaffUserInfo">Show User info</label>
            </div>

            <div class="user_info staff_user_info">
                <div class="mb-3">
                    <label for="EditStaffUsername" class="form-label ">Username</label>
                    <input name="staff_username" type="text" readonly
                           class="form-control"
                           id="EditStaffUsername" aria-describedby="emailHelp"
                           value="<%=staff.getUser().getUsername()%>"
                    >
                </div>
                <div class="mb-3">
                    <label for="EditStaffPassword" class="form-label ">Password</label>
                    <input name="staff_password" type="text"
                           class="form-control"
                           id="EditStaffPassword" aria-describedby="emailHelp"
                           value="<%=staff.getUser().getPassword()%>"
                    >

                </div>
                <div class="mb-3">
                    <label for="EditStaffRole" class="form-label ">Role</label>
                    <input name="staff_role" type="text" readonly
                           class="form-control"
                           id="EditStaffRole" aria-describedby="emailHelp"
                           value="<%=staff.getUser().getRole()%>"
                    >

                </div>
                <div class="form-check form-switch">
                    <%
                      if (staff.getUser().isActive()){
                    %>
                    <input class="form-check-input" name="staff_active" type="checkbox" checked id="ActiveStatus"
                           value="<%=staff.getUser().isActive()%>"
                    >
                    <%
                        }else{
                    %>
                    <input class="form-check-input" name="staff_active" type="checkbox" id="ActiveStatus"
                           value="<%=staff.getUser().isActive()%>"
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
    <button id="update_staff_btn" type="submit" class="btn btn-primary">Update</button>
</div>


<script>
    $(document).ready(function () {
        $('#EditStaffUserInfo').click(function () {
            let checkBox = this.checked;
            console.log(checkBox)
            if (checkBox===true){
                $('.staff_user_info').addClass('user_info_Show')
            }
            else {
                $('.staff_user_info').removeClass('user_info_Show')
            }
        })
    })
</script>