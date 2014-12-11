$(document).ready(
     function () {
         try {
             $("#pnlShowMessage").hide();
             setInterval(GetMessage, $("#hidInterval").val());
         }
         catch (err) {
             alert(err);
         }
     }
);

function GetMessage() {
    if ($("#pnlShowMessage").css("display") == 'block') {
        $("#pnlShowMessage").hide();
    }
    else {
        showMessage();
    }
}

function showMessage() {
    var userId = $("#hidUserId").val();
    var path = $("#hidPath").val();
    $.ajax(
      {
          type: "POST",
          url: path + "/GetEventList",
          data: "{'userId' : " + userId + " }",
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          async: true,
          cache: false,
          success: function (msg) {
              var eventList = $.parseJSON(msg.d);
              if (eventList != '') {
                  $("#tblMessage").empty();
                  var htmlStr = "";
                  for (var i = 0; i < eventList.length; i++) {
                      var event = eventList[i];
                      htmlStr += ("<tr><td><a href='" + event.URL + "'>" + event.Name + "</a></td><td>" + event.Count + "</td></tr>");
                  }
                  $("#tblMessage").html(htmlStr);
                  $("#pnlShowMessage").show();
              }
              else {
                  $("#pnlShowMessage").hide();
              }
          },
          error: function (x, e) {
              alert("The call to the server side failed. " + x.responseText);
          }
      }
    );
}
