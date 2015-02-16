$(document).ready(function() {

  $.ajaxSetup({json:true});

  $(document).ajaxStart(function(){
    $('#result').empty();
  })

  $(document).ajaxError(function(e, req, res, error)
  {
    console.error("Oh shit: %s", error);
  });

  $('#show_find').on('click', function(){
    $('#result').empty();
    $("div").removeClass("hidden_show");
  });

  $('#show_add').on('click', function(){
    $('#result').empty();
    $("div").removeClass("hidden_find");
  });

  $('#new').on('submit',function(){
    // var form = $(this);
    $.ajax({
      url: "/api/new",
      type: "POST",
      dataType: 'json',
      data: $("#new").serialize(),
      success: function(response){
          // var response = JSON.parse(contact.responseText);
          $('div')
          $('#result').append('<div>ID: ' + response.id + '<br> Name: ' +
           response.name + ' - Email: ' + response.email + ' - Phone: ' + response.phone + '</div>');
      }
    });
    return false;
  });


  $('#list').on('click', function(){
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

  var updateContact = function(contact)
  {
    $('.flex-container').append('<ul class=".flex-item"><li> ID: ' + contact.id +
      '<li> Name: ' + contact.name +
      '<li> Email: ' + contact.email +
      '<li> Phone: ' + contact.phone +
    '</ul>');
  }

  $('#search').on('submit', function(e)
  {
    e.stopPropagation();
    e.preventDefault();
    var id = $('#id_tofind').val();
    $.get("/api/search/" + id).then(updateContact);
  });
});
