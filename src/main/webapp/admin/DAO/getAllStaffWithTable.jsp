
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.StaffDAO" %>
<%@ page import="Entity.Staff" %>

<%
    StaffDAO staffDAO = new StaffDAO(ConnectionProvider.getConnection());
    List<Staff> staffs = staffDAO.getAllStaff();
    for (Staff staff : staffs) {
%>
<tr>
    <td data-label="Id"><%=staff.getId()%>
    </td>
    <td data-label="Name"><%=staff.getName()%>
    </td>
    <td data-label="Email"><%=staff.getEmail()%>
    </td>
    <td data-label="Phone No"><%=staff.getPhone_no()%>
    </td>
    <td data-label="Department"><%=staff.getDepartment()%>
    </td>
    <td data-label="Username"><%=staff.getUser().getUsername()%>
    </td>
    <td data-label="Action">
        <div class="row">
            <div class="col-sm-6 col-lg-12 col-xl-6 g-2 d-flex justify-content-center">
                <Button
                        onclick="setDataOnUpdateStaffModal(<%=staff.getId()%>)"
                        class="btn doc_add_btn"
                        aria-label="Edit Doctor"
                        data-toggle="modal"
                        data-placement="left"
                        title="Add Doctor"
                        type="button"
                        data-target="#editStaffModal"
                >
                    <i class="far fa-edit" style="font-size: 15px;"></i>
                </Button>
            </div>
            <div class="col-sm-6 col-lg-12 col-xl-6 d-flex justify-content-center g-2">
                <Button
                        onclick="deleteStaff(`<%=staff.getId()%>`, `<%=staff.getUser().getUsername()%>`)"
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

