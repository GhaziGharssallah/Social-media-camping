/**
 * Created by lvntayn on 03/06/2017.
 */

$(function() {
    $('.datepicker').datepicker();

    $('[data-toggle="tooltip"]').tooltip();

    $(".select2-multiple").select2();
    $(".js-example-placeholder-single").select2({
        placeholder: "Choisissez l'état",
        allowClear: true
    });

});

window.resetFile = function (e) {
    e.wrap('<form>').closest('form').get(0).reset();
    e.unwrap();
};

function makeSerializable(elem) {
    return $(elem).prop('elements', $('*', elem).andSelf().get());
}


var location_finder = "not-running";
var found_location = "";
function getLocation() {
    if (navigator.geolocation) {
        return navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else {
        $('#errorMessageModal').modal('show');
        $('#errorMessageModal #errors').html("La géolocalisation n'est pas prise en charge par ce navigateur..");
    }
}

function showPosition(position) {
    var location = {latitude: position.coords.latitude, longitude: position.coords.longitude};
    location_finder = "trouvé";
    found_location = location;
}

function showError(error) {
    var error_msg = null;
    switch(error.code) {
        case error.PERMISSION_DENIED:
            error_msg = "Vous avez annulé la demande de géolocalisation.";
            break;
        case error.POSITION_UNAVAILABLE:
            error_msg = "Données de géolocalisation incorrectes.";
            break;
        case error.TIMEOUT:
            error_msg = "Expiré.";
            break;
        case error.UNKNOWN_ERROR:
            error_msg = "Erreur.";
            break;
    }
    $('#errorMessageModal').modal('show');
    $('#errorMessageModal #errors').html(error_msg);
    location_finder = "pas trouvé";
}


var found_location2 = "";
var location_finder2 = "ne fonctionne pas";
function getLocation2() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition2);
    } else {
        location_finder2 = "ne fonctionne pas";
    }
}
function showPosition2(position) {
    found_location2 = {latitude: position.coords.latitude, longitude: position.coords.longitude};
    location_finder2 = "trouvé ! ";
}

function autoFindLocation(){

    location_finder2 = "running";

    getLocation2();


    var updated = false;
    var timer = setInterval(function(){
        if (location_finder2 == 'found'){

            $.ajax({
                url: BASE_URL+'/save-my-location',
                type: "GET",
                timeout: 5000,
                data: "latitude="+found_location2.latitude+"&longitude="+found_location2.longitude,
                contentType: false,
                cache: false,
                processData: false,
                headers: {'X-CSRF-TOKEN': CSRF},
                success: function(response){

                },
                error: function(){
                }
            });

            clearInterval(timer);
        }else{
            if (updated == false) {
                $.ajax({
                    url: BASE_URL + '/save-my-location2',
                    type: "GET",
                    timeout: 5000,
                    data: "",
                    contentType: false,
                    cache: false,
                    processData: false,
                    headers: {'X-CSRF-TOKEN': CSRF},
                    success: function (response) {

                    },
                    error: function () {
                    }
                });
            }
            updated = true;
        }

    }, 1);
}


function follow(following, follower, element, size){

    var data = new FormData();
    data.append('following', following);
    data.append('follower', follower);
    data.append('element', element);
    data.append('size', size);


    $.ajax({
        url: BASE_URL + '/follow',
        type: "POST",
        timeout: 5000,
        data: data,
        contentType: false,
        cache: false,
        processData: false,
        headers: {'X-CSRF-TOKEN': CSRF},
        success: function (response) {
            if (response.code == 200) {
                $(element).html(response.button);
                if (response.refresh == 1 && size != '.btn-no-refresh'){
                    location.reload();
                }
            } else {
                $('#errorMessageModal').modal('show');
                $('#errorMessageModal #errors').html('Une erreur s"est produite!');
            }
        },
        error: function () {
            $('#errorMessageModal').modal('show');
            $('#errorMessageModal #errors').html('Une erreur s"est produite.!');
        }
    });

}

function followRequest(type, id){

    var data = new FormData();
    data.append('type', type);
    data.append('id', id);

    $.ajax({
        url: BASE_URL + '/follower/request',
        type: "POST",
        timeout: 5000,
        data: data,
        contentType: false,
        cache: false,
        processData: false,
        headers: {'X-CSRF-TOKEN': CSRF},
        success: function (response) {
            if (response.code == 200) {
                $('#approve-buttons-'+id+' .btn').remove();
                if (type == 1){
                    $('#approve-buttons-'+id+' .approved').show();
                }else{
                    $('#approve-buttons-'+id+' .denied').show();
                }
            } else {
                $('#errorMessageModal').modal('show');
                $('#errorMessageModal #errors').html('Une erreur s"est produite.');
            }
        },
        error: function () {
            $('#errorMessageModal').modal('show');
            $('#errorMessageModal #errors').html('Une erreur s"est produite.');
        }
    });

}

function deniedFollow(me, follower, element, size){

    var data = new FormData();
    data.append('me', me);
    data.append('follower', follower);
    data.append('element', element);
    data.append('size', size);


    $.ajax({
        url: BASE_URL + '/follower/denied',
        type: "POST",
        timeout: 5000,
        data: data,
        contentType: false,
        cache: false,
        processData: false,
        headers: {'X-CSRF-TOKEN': CSRF},
        success: function (response) {
            if (response.code == 200) {
                location.reload();
            } else {
                $('#errorMessageModal').modal('show');
                $('#errorMessageModal #errors').html('Une erreur s"est produite.');
            }
        },
        error: function () {
            $('#errorMessageModal').modal('show');
            $('#errorMessageModal #errors').html('Une erreur s"est produite.!');
        }
    });

}


function relativeRequest(type, id){

    var data = new FormData();
    data.append('type', type);
    data.append('id', id);

    $.ajax({
        url: BASE_URL + '/relative/request',
        type: "POST",
        timeout: 5000,
        data: data,
        contentType: false,
        cache: false,
        processData: false,
        headers: {'X-CSRF-TOKEN': CSRF},
        success: function (response) {
            if (response.code == 200) {
                $('#approve-buttons-'+id+' .btn').remove();
                if (type == 1){
                    $('#approve-buttons-'+id+' .approved').show();
                }else{
                    $('#approve-buttons-'+id+' .denied').show();
                }
            } else {
                $('#errorMessageModal').modal('show');
                $('#errorMessageModal #errors').html('Une erreur s"est produite.!');
            }
        },
        error: function () {
            $('#errorMessageModal').modal('show');
            $('#errorMessageModal #errors').html('Une erreur s"est produite.!');
        }
    });

}

function removeRelation(type, id){

    BootstrapDialog.show({
        title: 'Supprimer les relations!',
        message: 'Voulez-vous vraiment supprimer?',
        buttons: [{
            label: "Да,уверен",
            cssClass: 'btn-danger',
            action: function(dialog) {

                var data = new FormData();
                data.append('type', type);
                data.append('id', id);


                $.ajax({
                    url: BASE_URL + '/relative/delete',
                    type: "POST",
                    timeout: 5000,
                    data: data,
                    contentType: false,
                    cache: false,
                    processData: false,
                    headers: {'X-CSRF-TOKEN': CSRF},
                    success: function(response){
                        dialog.close();
                        if (response.code == 200){
                            location.reload();
                        }else{
                            $('#errorMessageModal').modal('show');
                            $('#errorMessageModal #errors').html('Une erreur s"est produite!');
                        }
                    },
                    error: function(){
                        dialog.close();
                        $('#errorMessageModal').modal('show');
                        $('#errorMessageModal #errors').html('Une erreur s"est produite.!');
                    }
                });
            }
        }, {
            label: 'Non!',
            action: function(dialog) {
                dialog.close();
            }
        }]
    });
}