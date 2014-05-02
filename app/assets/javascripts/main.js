$(document).ready(function(){
  $("#notify").hide();
  $("#search_form").submit(function(){
    $("div.main_content").html();
    search_val = $("#search_field").val();
    $.ajax({
      url: "/blog_list/search?url="+search_val,
      beforeSend: function(){
        $("#notify").show();
        $("#search_button").attr("disabled", "disabled");
      },
      success: function(data){
        $("#notify").hide();
        $("div.main_content").html(data);
        $('div.main_content table').dataTable({
          "sPaginationType": "bootstrap"
        });
        $("#search_button").removeAttr("disabled");
      }
    });
    return false;
  });
});
