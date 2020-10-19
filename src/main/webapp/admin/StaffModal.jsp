


<div class="modal animate__animated animate__backInDown addStaffModal" id="addStaffModal" tabindex="-1"
     aria-labelledby="addStaffModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addStaffModalLabel">Add Staff</h5>
                <button type="button" class="btn-close" id="addStaffModalClose" data-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form id="addStaffByAdmin" action="addStaffServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row">
                        <div class="col">

                            <div class="mb-3">
                                <label for="InputUsernameStaff" class="form-label ">Username</label>
                                <input name="staff_username" type="text" required class="form-control usernameStaff is-invalid"
                                       id="InputUsernameStaff" aria-describedby="emailHelp">
                                <div id="validationServerUsernameFeedback" class="invalid-feedback un_feed_staff"
                                     style="display: none">
                                    Username already exists.
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="InputNameStaff" class="form-label ">Name</label>
                                <input name="staff_name" type="text" required class="form-control"
                                       id="InputNameStaff" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="InputEmailStaff" class="form-label">Email address</label>
                                <input required name="staff_email" type="email" class="form-control" id="InputEmailStaff"
                                       aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="InputAddressStaff" class="form-label">Address</label>
                                <textarea name="staff_address" type="text" class="form-control"
                                          id="InputAddressStaff"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="InputPhoneStaff" class="form-label">Phone No</label>
                                <input required name="staff_phone" type="number" class="form-control" id="InputPhoneStaff"
                                >
                            </div>
                            <div class="mb-3">
                                <label for="InputSalaryStaff" class="form-label">Salary</label>
                                <input required name="staff_salary" type="number" class="form-control" id="InputSalaryStaff"
                                >
                            </div>
                            <div class="mb-3">
                                <label for="InputDepartmentStaff" class="form-label">Department</label>
                                <select name="staff_department" id="InputDepartmentStaff" class="form-select" aria-label="Department">
                                    <option selected></option>
                                    <option value="Department1">Department1</option>
                                    <option value="Department2">Department2</option>
                                    <option value="Department3">Department3</option>
                                </select>
                            </div>



                            <div class="mb-3">
                                <label class="form-label col-12">Gender</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input"  type="radio" name="staff_gender" id="inlineRadio1" value="MALE">
                                    <label class="form-check-label" for="inlineRadio1">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="staff_gender" id="inlineRadio2" value="FEMALE">
                                    <label class="form-check-label" for="inlineRadio2">Female</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="staff_gender" id="inlineRadio3" value="OTHER">
                                    <label class="form-check-label" for="inlineRadio3">Other</label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="add_Staff_btn" type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal animate__animated animate__backInDown editStaffModal" id="editStaffModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Update Staff</h5>
                <button type="button" class="btn-close" id="editStaffModalClose" data-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <form id="editStaffByAdmin" action="updateStaffServlet" method="post" enctype="multipart/form-data">

            </form>
        </div>
    </div>
</div>

