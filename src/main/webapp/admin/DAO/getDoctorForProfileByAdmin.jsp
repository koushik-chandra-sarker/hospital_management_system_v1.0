<script src="../resource/TimePicker/timepicker.js"></script>
<%@ page import="DAO.DoctorDAO" %>
<%@ page import="Helper.ConnectionProvider" %>
<%@ page import="Entity.Doctor" %>
<%
    String[] days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
    String[] shifts = {"Shift1", "Shift2"};
%>

<%
    int id  = Integer.parseInt(request.getParameter("docId"));

    DoctorDAO doctorDAO = new DoctorDAO(ConnectionProvider.getConnection());
    Doctor doctor = doctorDAO.getDoctorById(id);
%>

<div class="modal-content DoctorProfileModalContent">
    <div class="modal-header">
        <div class="d-flex">
            <img src="../resource/icons/DefaultprofilePic.png" alt="">
            <h5 class="modal-title pl-3 pt-2" id="docProfileModalLabel"><%=doctor.getUser().getUsername()%></h5>
        </div>
        <Button

                class="btn-close btn doc_add_btn" id="DocProfileModalClose" data-dismiss="modal"
                aria-label="Close"
                type="button"

        >
            <i class="fas fa-times"></i>
        </Button>
    </div>
    <div class="container-fluid doc_pro_Body">
        <div class="row ">
            <div class="col-md-5 col-lg-4 col-12 g-3 mt-4 pl-4 doc_profile_card">
                <div class="d_card position-relative ">
                    <div class="row">
                        <div class="col-12 mt-4 d-flex justify-content-center">
                            <img src="../resource/icons/DefaultprofilePic.png" width="200px" alt="">
                        </div>
                        <div class="col-12 mt-3 d-flex justify-content-center">
                            <h5><b>Id:</b> <%=doctor.getId()%></h5>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <h5><b>Name:</b> <%=doctor.getName()%></h5>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <h5><b>Email:</b> <%=doctor.getEmail()%></h5>
                        </div>
                        <div class="col-12  d-flex justify-content-center">
                            <h5><b>Phone:</b> <%=doctor.getPhone_no()%></h5>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <h5><b>Speciality:</b> <%=doctor.getSpeciality()%></h5>
                        </div>
                        <div class="col-12 d-flex justify-content-center">
                            <h5><b>Qualification:</b></h5>
                        </div>
                        <div class="col-12 pl-5 pr-5 d-flex justify-content-center">
                            <p><%=doctor.getQualification()%></p>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-7 col-lg-8 col-12 g-3 mt-4 pl-4 doc_profile_card">

                <div class="row">
                    <div class="col-12 docProfileContentMain doc_profile_content">
                        <div class="row">
                            <div class="col-12">
                                <div class="btn-group rounded-left-2" role="group"
                                     aria-label="Basic radio toggle button group">
                                    <input onclick="docProfileContentPage()" type="radio" class="btn-check"
                                           name="doc_profile_radio" value="availability" id="btnradio1"
                                           autocomplete="off" checked>
                                    <label class="btn btn-outline-primary" for="btnradio1"
                                           style="border-top-left-radius: 10px;">Availability</label>

                                    <input onclick="docProfileContentPage()" type="radio" class="btn-check"
                                           name="doc_profile_radio" value="addAvailability" id="btnradio2"
                                           autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio2">Add
                                        Availability</label>

                                    <input onclick="docProfileContentPage()" type="radio" class="btn-check"
                                           name="doc_profile_radio" value="editAvailability" id="btnradio3"
                                           autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btnradio3">Edit
                                        Availability</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 g-3">
                                <div class=" doc_Pro_content_avail content_active position-relative "
                                     style="display: none">

                                    <div class="col-12 doc_avail_card mt-4">
                                        <div class="d_card position-relative ">
                                            <div class="avail_title">
                                                <h5>Sunday</h5>
                                            </div>
                                            <div class="row container ">
                                                <div class="col-12 g-3 d-flex justify-content-around">
                                                    <div>
                                                        <h6><b>Start Time :</b> 12.48 pm</h6>
                                                    </div>
                                                    <div >
                                                        <h6><b>End Time :</b> 12.48 pm</h6>
                                                    </div>
                                                </div>
                                                <div class="col-12 g-3 d-flex justify-content-center">
                                                    <div class="avail_line"></div>
                                                </div>
                                            </div>

                                            <div class="row container ">
                                                <div class="col-12 g-3 d-flex justify-content-around">
                                                    <div>
                                                        <h6><b>Patient Limit :</b> 30</h6>
                                                    </div>
                                                    <div>
                                                        <h6><b>Room : </b>D_101</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" avail_title avail_footer position-absolute">
                                                <h5><b>Shift : </b> shift1</h5>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class=" position-relative doc_Pro_content_add_avail"
                                     style="display: none">

                                    <div class="row">
                                        <div class="col">

                                            <form id="addDocAvailabilityByAdmin" action="addDoctorAvailabilityServlet" method="post" enctype="multipart/form-data">
                                                <input type="text" name="doc_id" value="<%=doctor.getId()%>" hidden>
                                                <div class="mb-3 doc_avail_custom_select">
                                                    <label for="InputDoc_avail_day" class="form-label"
                                                           style=" color: #21e6c1;">Day</label>
                                                    <select name="doc_avail_day" id="InputDoc_avail_day"
                                                            class="form-select addAvailabilityInput"
                                                            aria-label="Day">
                                                        <option selected></option>
                                                        <%
                                                            for (String day : days) {
                                                        %>
                                                        <option value="<%=day%>"><%=day%>
                                                        </option>

                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="mb-3">
                                                    <%--  configure on timepicker.js--%>
                                                    <label for="InputDoc_avail_startTime" class="form-label "
                                                           style=" color: #21e6c1;">Start Time</label>
                                                    <input name="doc_avail_startTime" type="text" required
                                                           class="form-control addAvailabilityInput"
                                                           id="InputDoc_avail_startTime">
                                                </div>
                                                <div class="mb-3">
                                                    <%--  configure on timepicker.js--%>
                                                    <label for="InputDoc_avail_endTime" class="form-label"
                                                           style=" color: #21e6c1;">End Time</label>
                                                    <input required name="doc_avail_endTime" type="text"
                                                           class="form-control addAvailabilityInput"
                                                           id="InputDoc_avail_endTime"
                                                    >
                                                </div>
                                                <div class="mb-3 doc_avail_custom_select">
                                                    <label for="InputDoc_avail_shift" class="form-label"
                                                           style=" color: #21e6c1;">Shift</label>
                                                    <select name="doc_avail_shift" id="InputDoc_avail_shift"
                                                            class="form-select addAvailabilityInput"
                                                            aria-label="Shift">
                                                        <option selected></option>
                                                        <%
                                                            for (String shift : shifts) {
                                                        %>
                                                        <option value="<%=shift%>"><%=shift%>
                                                        </option>

                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="mb-3">
                                                            <label for="InputDoc_avail_patient_limit" class="form-label"
                                                                   style=" color: #21e6c1;">Patient Limit</label>
                                                            <input name="doc_avail_patient_limit" type="number"
                                                                   class="form-control addAvailabilityInput"
                                                                   id="InputDoc_avail_patient_limit"
                                                            >
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mb-3">
                                                            <label for="InputDoc_avail_room" class="form-label"
                                                                   style=" color: #21e6c1;">Room</label>
                                                            <input name="doc_avail_room" type="text"
                                                                   class="form-control addAvailabilityInput"
                                                                   id="InputDoc_avail_room"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mt-3">
                                                    <button id="add_Staff_btn" type="submit" class="btn btn-primary form-control">Add</button>
                                                </div>


                                            </form>

                                        </div>
                                    </div>

                                </div>
                                <div class=" position-relative doc_Pro_content_edit_avail"
                                     style="display: none">
                                    <h5 style="color: white">edit Availability</h5>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>

            </div>

        </div>
    </div>


</div>

<script>
    $(document).ready(function () {
        $('#addDocAvailabilityByAdmin').on('submit', function (event) {
            event.preventDefault();
            let form = new FormData(this);
            console.log("Submit")
            $.ajax({
                url: "/addDoctorAvailabilityServlet",
                type: 'POST',
                data: form,
                success: function (data) {
                    if (data.trim() === 'true') {
                        getAllDocAvail()
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: 'Added Successful',
                            showConfirmButton: false,
                            timer: 3000
                        })
                        $("#InputDoc_avail_day").val("")
                        $("#InputDoc_avail_startTime").val("")
                        $("#InputDoc_avail_endTime").val("")
                        $("#InputDoc_avail_shift").val("")
                        $("#InputDoc_avail_patient_limit").val("")
                        $("#InputDoc_avail_room").val("")
                    }
                    else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!'
                        })
                    }
                },
                error: function () {
                    Swal.fire({
                        icon: 'error',
                        title: 'error...',
                        text: 'Something went wrong!'
                    })
                },
                processData: false,
                contentType: false

            })

        });
    })
</script>