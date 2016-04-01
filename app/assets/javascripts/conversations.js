// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// console.log conversation_id
// console.log "inside coffeescript"

// # $(document).ready ->
// #     $ ->
// #       update = undefined
// #       console.log 'inside of function'
    
// #       update = ->
// #         $.get '/conversations/' + conversation_id, null, (data, status, jqXHR) ->
// #           d = undefined
// #           m = undefined
// #           msgsSorted = undefined
// #           _i = undefined
// #           _len = undefined
// #           msgsSorted = _.sortBy(data, (message) ->
// #             new Date(message.created_at).getTime()
// #           )
// #           $('.message_box').empty()
// #           _i = 0
// #           _len = msgsSorted.length
// #           while _i < _len
// #             m = msgsSorted[_i]
// #             d = moment(m.created_at)
// #             $('.message_box').append '<li>' + '<span class="created_at">' + d.format('hh:mm') + '</span>' + m.content + '</li>'
// #             _i++
// #           setTimeout update, 2000
// #           /(?:)/
    
// #       update()
// #     return

  // console.log("halp")
  // console.log(conversation_id)
  
  //   function loadMessages() {
  //       $(function() {
  //       var update;
  //       console.log("load messages was called!");
  //       update = function() {
  //         return $.get('/conversations/' + conversation_id, null, function(data, status, jqXHR) {
  //           var d, m, msgsSorted, _i, _len;
  //           msgsSorted = _.sortBy(data, function(message) {
  //             return new Date(message.created_at).getTime();
  //           });
  //           $('#message_box').empty();
  //           for (_i = 0, _len = msgsSorted.length; _i < _len; _i++) {
  //             m = msgsSorted[_i];
  //             d = moment(m.created_at);
  //             // $('.chat_message').prepend('<%= escape_javascript(render @messages) %>');
  //             $('#message_box').append('<li>' + '<span class="created_at">' + d.format('hh:mm') + '</span>' + m.content + '</li>');
  //           }
  //           return /(?:)/;
  //         });
  //       };
  //       setTimeout(update, 2000);
  //       return update();
  //       return(false);
  //   });
  // }

  console.log("In conversation.js");
  console.log("gon: "+gon.conversation_id);
  // console.log("Conversation id is: "+ conversation_id)
  var Thera = this;
  console.log("Thera global obj is :" + Thera);

  // Thera.showAllMessages = function(data, status, xhr) {
  //   console.log("renderAllMessages");
  //   console.log("data: "+ data);
  //   $('#messages').replaceWith(data);  //replaceHtml
  // };
  
  // Thera.getAllMessages = function(data) {
  //   console.log("getAllMessages");
  //   $.ajax({
  //     type: "GET",
  //     url: "/conversations/"+gon.conversation_id+"/edit",
  //     dataType: "JSON",
  //   }).success(showAllMessages(data));
  // };
  
  // Gets latest messages every 2 seconds
  Thera.updateMessages = function() {
    $.ajax({type: "GET", url: "/conversations/"+conversation_id,}).
      success(Thera.renderAllMessages).
      error(console.log("barf"));
  setTimeout(Thera.updateMessages, 2000);
  };

  // page ready function
  Thera.setupTimer = function() {
   setTimeout(Thera.updateMessages, 2000);
  };  
  
  // Shows latest messages after submitting a new one 
  Thera.renderAllMessages = function(data) {
    // console.log(data)
    $('#messages').html(data);
    $('form#message_box').val('');
  }
  
  // Submit a new messages
  Thera.submitNewMessage = function() {
    // clear text box here
    var valuesToSubmit = $('form#message_box').serialize();
    var response;
    $.ajax({
        type: "POST",
        url: "/messages",
        data: valuesToSubmit,
        dataType: "html" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function (data) { 
      console.log("success function is called");
      Thera.renderAllMessages(data);
      })
    .error(function (data) {
      console.log("error, data is: " + data);
    })
    console.log("uh");
  };

$('form#message_box').submit(function() {
  Thera.submitNewMessage();
  return false;
});

// $('form#message_box').submit(function() {  
//     var valuesToSubmit = $(this).serialize();
//     $.ajax({
//         type: "POST",
//         url: $(this).attr('action'), //sumbits it to the given url of the form
//         data: valuesToSubmit,
//         dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
//     }).success(function(json){
//         console.log("success");
//     }).error(function(json){
//       console.log("error", json);
//     });
//     return false; // prevents normal behaviour
// });

// $('form#message_box').trigger('submit.rails');

  // $('form#message_box').submit(function () {
  //   loadMessages();
  //   return false;
  // });
  
    



// # <script>
// #     var conversation_id = "<% @conversation.id %>";
// #     $(function() {
// #     var update;
// #     console.log("poop");
// #     update = function() {
// #       return $.get('/conversations/' + conversation_id, null, function(data, status, jqXHR) {
// #         var d, m, msgsSorted, _i, _len;
// #         msgsSorted = _.sortBy(data, function(message) {
// #           return new Date(message.created_at).getTime();
// #         });
// #         $('.message_box').empty();
// #         for (_i = 0, _len = msgsSorted.length; _i < _len; _i++) {
// #           m = msgsSorted[_i];
// #           d = moment(m.created_at);
// #           $('.message_box').append('<li>' + '<span class="created_at">' + d.format('hh:mm') + '</span>' + m.content + '</li>');
// #         }
// #         setTimeout(update, 2000);
// #         return /(?:)/;
// #       });
// #     };
// #     return update();
// # });
// # </script>