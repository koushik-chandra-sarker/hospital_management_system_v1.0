

$(document).ready(function () {

    // Get all Doctor and set on table (getAllDoctorInTable.jsp)
    getAllDoctors()
    // Get all Staff and set on table (getAllStaffWithTable.jsp)
    getAllStaffs()

    getAllPatient()

    updatePatientLimit()

    let user = [];


    /**############################################################*/
    // Get UsernameList
    $('.doc_add_btn').on('click', function (event) {

        $.ajax({
            url: "DAO/getAllUsername.jsp",
            dataType: "json",
            success: function (data) {
                user.push(data)
            }, error: function () {
                console.log("error")
            },
            processData: false,
            contentType: 'application/json',

        })

    });
    /**############################################################*/
    // Username Validation of doctor
    $('#InputUsername').on("keyup", function () {
        var username = this.value;
        console.log(username)
        if (user[0].indexOf(username) === -1) {
            $('.username').removeClass("is-invalid").addClass("is-valid")
            $('.un_feed').removeClass("content_active")

        } else {
            $('.username').addClass("is-invalid")
            $('.un_feed').addClass("content_active")


        }

    })
    /**############################################################*/
    // Username Validation for staff
    $('#InputUsernameStaff').on("keyup", function () {
        var username = this.value;
        console.log(username)
        if (user[0].indexOf(username) === -1) {
            $('.usernameStaff').removeClass("is-invalid").addClass("is-valid")
            $('.un_feed_staff').removeClass("content_active")

        } else {
            $('.usernameStaff').addClass("is-invalid")
            $('.un_feed_staff').addClass("content_active")


        }

    })
    /**############################################################*/
    // Username Validation for patient
    $('#InputUsernamePatient').on("keyup", function () {
        var username = this.value;
        console.log(username)
        if (user[0].indexOf(username) === -1) {
            $('.usernamePatient').removeClass("is-invalid").addClass("is-valid")
            $('.un_feed_patient').removeClass("content_active")

        } else {
            $('.usernamePatient').addClass("is-invalid")
            $('.un_feed_patient').addClass("content_active")


        }

    })
    /**############################################################*/
    // Add Doctor
    $('#addDoctorByAdmin').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);


        $.ajax({
            url: "/addDoctorServlet",
            type: 'POST',
            data: form,
            success: function (data) {
                if (data.trim() === 'true') {
                    getAllDoctors()
                    Swal.fire(
                        'Good job!',
                        'You clicked the button!',
                        'success'
                    )
                    $("#InputUsername").val("")
                    $("#InputName").val("")
                    $("#InputEmail").val("")
                    $("#InputPhone").val("")
                    $("#InputSpeciality").val("")
                    $("#InputQualification").val("")
                } else {
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
    /**############################################################*/
    // Add Stuff
    $('#addStaffByAdmin').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        console.log("Submit")
        $.ajax({
            url: "/addStaffServlet",
            type: 'POST',
            data: form,
            success: function (data) {
                if (data.trim() === 'true') {
                    getAllStaffs()
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Staff Added Successful',
                        showConfirmButton: false,
                        timer: 3000
                    })
                    $("#InputUsernameStaff").val("")
                    $("#InputNameStaff").val("")
                    $("#InputEmailStaff").val("")
                    $("#InputPhoneStaff").val("")
                    $("#InputAddressStaff").val("")
                    $("#InputSalaryStaff").val("")
                    $("#InputDepartmentStaff").val("")
                } else {
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

    /**############################################################*/
    // Add Patient
    $('#addPatientByAdmin').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        $.ajax({
            url: "/addPatientServlet",
            type: 'POST',
            data: form,
            success: function (data) {
                if (data.trim() === 'true') {
                    patientAppointmentModal(form.get("patient_username"))
                    getAllPatient()
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Added Successful',
                        showConfirmButton: false,
                        timer: 2000
                    })
                    $("#InputUsernamePatient").val("")
                    $("#InputNamePatient").val("")
                    $("#InputEmailPatient").val("")
                    $("#InputAddressPatient").val("")
                    $("#InputPhonePatient").val("")
                    $("#InputAgePatient").val("")
                } else {
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

    /**############################################################*/

    // Add Doctor Availability


    /**############################################################*/
    // Update Doctor
    $('#editDoctorByAdmin').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);

        $.ajax({
            url: "/updateDoctorServlet",
            type: 'POST',
            data: form,
            success: function (data) {
                if (data.trim() === 'true') {
                    getAllDoctors()
                    Swal.fire(
                        'Doctor Successfully Updated!',
                        'success'
                    )
                } else {
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
    /**############################################################*/
    /*update Staff*/
    $('#editStaffByAdmin').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        console.log(form)
        $.ajax({
            url: "/updateStaffServlet",
            type: 'POST',
            data: form,
            success: function (data) {
                if (data.trim() === 'true') {
                    getAllStaffs()
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Update Successful',
                        showConfirmButton: false,
                        timer: 2000
                    })
                } else {
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


function getAllDoctors() {
    $.ajax({
        url: "DAO/getAllDoctorInTable.jsp",
        success: function (data) {
            $("#a_doc_tableBody2").html(data);

        }
    })
}

function getAllStaffs() {
    $.ajax({
        url: "DAO/getAllStaffWithTable.jsp",
        success: function (data) {
            $("#a_staff_tableBody").html(data);

        }
    })
}

function setDataOnUpdateDoctorModal(docId) {
    $.ajax({
        url: "DAO/setDataOnUpdateDoctorModal.jsp",
        data: {docId: docId},
        success: function (data) {
            $("#editDoctorByAdmin").html(data);
        }
    })
}

function setDataOnUpdateStaffModal(Id) {
    $.ajax({
        url: "DAO/setDataOnUpdateStaffModal.jsp",
        data: {staffId: Id},
        success: function (data) {
            $("#editStaffByAdmin").html(data);
        }
    })
}


function deleteDoctor(id) {
    $.ajax({
        url: "/DeleteDoctorServlet",
        type: 'GET',
        data: {docId: id},
        success: function (data) {
            if (data.trim() === 'true') {
                getAllDoctors()
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Delete Successful',
                    showConfirmButton: false,
                    timer: 3000
                })
            } else {
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
        }

    })

}


function deleteStaff(id, username) {
    $.ajax({
        url: "/deleteStaffServlet",
        type: 'GET',
        data: {staffId: id, username: username},
        success: function (data) {
            if (data.trim() === 'true') {
                getAllStaffs()
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Delete Successful',
                    showConfirmButton: false,
                    timer: 3000
                })
            } else {
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
        }

    })

}

function getAllDocAvail() {


}

function updatePatientLimit() {
    var d = new Date().toISOString().split("T")[0];
    $.ajax({
        url: "/addPatientLimitServlet",
        data: {currentDate: d},
    })
}

function getAllPatient() {
    $.ajax({
        url: "DAO/getAllPatientWithTable.jsp",
        success: function (data) {
            $("#a_patient_tableBody").html(data);

        }
    })
}

function deletePatient(id, username) {
    $.ajax({
        url: "/DeletePatientServlet",
        type: 'GET',
        data: {patientId: id, username: username},
        success: function (data) {
            if (data.trim() === 'true') {
                getAllPatient()
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Delete Successful',
                    showConfirmButton: false,
                    timer: 3000
                })
            } else {
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
        }

    })

}

function searchPatientByAny() {
    var searchParam = $('#search_patient_by_any').val();
    if (searchParam === "") {
        getAllPatient()
    }
    else {
        $.ajax({
            url: "DAO/searchPatientByAnyWithTable.jsp",
            data: {searchParam: searchParam},
            success: function (data) {
                $("#a_patient_tableBody").html(data);
            }
        })
    }

}


function patientAppointmentModal(patientId) {
    $('.patient_table_row').attr("data-target","#appointPatientModal")
    $('#InputPatientIdAppointPatient').val(patientId)

}

function setDoctorOnAppointModal() {
    var date = $('#appointment_date').val();
    $.ajax({
        url: "DAO/loadDoctorOnAppointModal.jsp",
        data: {date: date},
        success: function (data) {
            $("#appoint_doctor").html(data);
        }
    })
}
$(document).ready(function () {

    // Add Patient Appointment
    $('#appointPatientByAdmin').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);


        $.ajax({
            url: "/addAppointmentServlet",
            type: 'POST',
            data: form,
            success: function (data) {
                if (data.trim() === "success"){
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Successful Appointed',
                        showConfirmButton: false,
                        timer: 1500
                     })
                }
                else if (data.trim() === "Already appointed"){
                    Swal.fire({
                        icon: 'info',
                        title: 'Already appointed',
                    })
                }
                else if (data.trim() === "No token Available"){
                    Swal.fire({
                        icon: 'warning',
                        title: 'Patient Limit Exists! Try Another Doctor..',
                    })
                }
                else {
                    Swal.fire({
                        icon: 'error',
                        title: 'error...',
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
