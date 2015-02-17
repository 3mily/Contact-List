$(document).ready(function() {

  $.ajaxSetup({json:true});
  $(document).ajaxStart(function(){
    $('#result').empty();
  })
  $(document).ajaxError(function(e, req, res, error){ 
    console.error("Oh shoot: %s", error);
  });


// -------- [POST] Create a new Contact ----------
  $('#new').on('submit',function(e){
    $.ajax({
      url: "/api",
      type: "POST",
      dataType: 'json',
      data: $("#new").serialize(),
      success: function(response){
        $('div')
        $('#result').append('<div>ID: ' + response.id + '<br> Name: ' +
        response.name + ' - Email: ' + response.email + ' - Phone: ' + response.phone + '</div>');
      }
    });
    return false;
  });

// -------- [GET] List all contacts ----------
  $('#list').on('click', function(e){
    $('#result').empty();
    $.ajax({
      url: "/api/list",
      type: "GET",
      dataType: 'json',
      success: function(contacts, status, xhr){
        contacts.forEach(updateContact);
      }
    });
    return false;
  });

// -------- [GET] List one contact ---------- // refactored to use '.then' method
  var updateContact = function(contact){
    $('.flex-container').append('<ul class=".flex-item"><li> ID: ' + contact.id +
      '<li> Name: ' + contact.name +
      '<li> Email: ' + contact.email +
      '<li> Phone: ' + contact.phone +
    '</ul>');
  }

  $('#search').on('submit', function(e){
    e.stopPropagation();
    e.preventDefault();
    var id = $('#id_tofind').val();
    $.get("/api/" + id).then(updateContact); // used '.get' method instead of type:"GET"
  });

// -------- [PUT] remove contact --------- not tested yet
  $('#update').on('submit', function(e){
    $('#result').empty();
    action = '/contacts/' + data.id;
    event.preventDefault();
    formData = $(this).serialize();
    data: $("#update").serialize(),
    success: function(response){
      $('div')
      $('#result').append('<div>ID: ' + response.id + '<br> Name: ' +
      response.name + ' - Email: ' + response.email + ' - Phone: ' + response.phone + '</div>');
    }
    });
  });

// -------- [DELETE] remove contact --------- to do: add delete button in View
  $('#delete').on('click', function(e){ 
    $('#result').empty();
    $.ajax({
      url: "/api/" + id,
      type: "DELETE",
      dataType: 'json',
      success: function(response){
        $('#result').append('<div> Contact Deleted! </div>');
      }
    });
    return false;
  });
});





//================ notes below ===============

//------ future features that will toggle visibility of certain elements ------

  // $('#show_find').on('click', function(){
  //   $('#result').empty();
  //   $("div").toggleClass("hidden_show");
  // });

  // $('#show_add').on('click', function(){
  //   $('#result').empty();
  //   $("div").toggleClass("hidden_find");
  // });
