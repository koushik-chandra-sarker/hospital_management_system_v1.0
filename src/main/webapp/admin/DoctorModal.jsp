
<div class="modal animate__animated animate__backInDown addDoctorModal" id="addDoctorModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Doctor</h5>
                <button type="button" class="btn-close" id="addDocModalClose" data-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form id="addDoctorByAdmin" action="addDoctorServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row">
                        <div class="col">

                            <div class="mb-3">
                                <label for="InputUsername" class="form-label ">Username</label>
                                <input name="doc_username" type="text" required class="form-control username is-invalid"
                                       id="InputUsername" aria-describedby="emailHelp">
                                <div id="validationServerUsernameFeedback" class="invalid-feedback un_feed"
                                     style="display: none">
                                    Username already exists.
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="InputName" class="form-label ">Name</label>
                                <input name="doc_name" type="text" required class="form-control"
                                       id="InputName" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="InputEmail" class="form-label">Email address</label>
                                <input required name="doc_email" type="email" class="form-control" id="InputEmail"
                                       aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="InputPhone" class="form-label">Phone No</label>
                                <input required name="doc_phone" type="number" class="form-control" id="InputPhone"
                                       aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="InputSpeciality" class="form-label">Speciality</label>
                                <input name="doc_speciality" type="text" class="form-control" id="InputSpeciality"
                                       aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="InputQualification" class="form-label">Qualification</label>
                                <textarea name="doc_qualification" type="text" class="form-control"
                                          id="InputQualification"></textarea>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="add_doc_btn" type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal animate__animated animate__backInDown addDoctorModal" id="editDoctorModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Update Doctor</h5>
                <button type="button" class="btn-close" id="editDocModalClose" data-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <form id="editDoctorByAdmin" action="updateDoctorServlet" method="post" enctype="multipart/form-data">

            </form>
        </div>
    </div>
</div>


<%--Doctor profile modal--%>
<div class="modal animate__animated animate__zoomIn DoctorProfileModal" id="DoctorProfileModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen modal-dialog-centered" id="doc_profile_modal_admin">

    </div>
</div>
<script>
    function docProfileContentPage() {
        console.log("RCalled")
        var v = $('input[name="doc_profile_radio"]:checked').val();
        if (v === "availability") {
            $('.doc_Pro_content_avail').addClass("content_active")
            $('.doc_Pro_content_add_avail').removeClass("content_active")
            $('.doc_Pro_content_edit_avail').removeClass("content_active")
        } else if (v === "addAvailability") {
            $('.doc_Pro_content_avail').removeClass("content_active")
            $('.doc_Pro_content_add_avail').addClass("content_active")
            $('.doc_Pro_content_edit_avail').removeClass("content_active")
        } else if (v === "editAvailability") {
            $('.doc_Pro_content_avail').removeClass("content_active")
            $('.doc_Pro_content_add_avail').removeClass("content_active")
            $('.doc_Pro_content_edit_avail').addClass("content_active")
        }
    }
</script>