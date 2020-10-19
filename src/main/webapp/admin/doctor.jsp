<%@ page import="DAO.DoctorDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="Entity.Doctor" %>
<%@ page import="java.util.List" %>

<%@include file="DoctorModal.jsp" %>


<div class="doctor animate__animated animate__zoomIn" style="display: none">
    <div class="row">
        <div class="col-12 g-4">
            <div class="col d-flex justify-content-between">
                <h4 class="doc_header">Doctors</h4>
                <Button

                        class="btn doc_add_btn"
                        aria-label="Add Doctor"
                        data-toggle="modal"
                        data-placement="left"
                        title="Add Doctor"
                        type="button"
                        data-target="#addDoctorModal"
                >
                    <i class="fas fa-plus"></i>
                </Button>
            </div>
        </div>

        <div class="col-12">
            <div class="table_header">
                <h5>Available Doctors</h5>
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
                                <th>Speciality</th>
                                <th>Username</th>
                                <th>Action</th>

                            </tr>

                            </thead>

                            <tbody id="a_doc_tableBody2">

                            </tbody>

                        </table>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>