
<%@include file="StaffModal.jsp" %>


<div class="staff animate__animated animate__zoomIn" style="display: none">
    <div class="row">
        <div class="col-12 g-4">
            <div class="col d-flex justify-content-between">
                <h4 class="doc_header">Staff</h4>
                <Button

                        class="btn doc_add_btn"
                        aria-label="Add Staff"
                        data-toggle="modal"
                        data-placement="left"
                        title="Add Staff"
                        type="button"
                        data-target="#addStaffModal"
                >
                    <i class="fas fa-plus"></i>
                </Button>
            </div>
        </div>

        <div class="col-12">
            <div class="table_header">
                <h5>List of Staff</h5>
            </div>
        </div>
        <div class="col-12 g-3">
            <div class="d_card position-relative d_card_table doc_card_table ">
                <div class="table_container">
                    <div class="table_main">
                        <table>
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone No</th>
                                <th>Department</th>
                                <th>Username</th>
                                <th>Action</th>

                            </tr>

                            </thead>

                            <tbody id="a_staff_tableBody">
                            </tbody>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>