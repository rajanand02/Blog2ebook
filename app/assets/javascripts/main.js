$(document).ready(function(){
  $("#notify").hide();
  $("#search_form").submit(function(){
    search_val = $("#search_field").val();
    $.ajax({
      url: "/blog_list/search?url="+search_val,
      beforeSend: function(){
        $("#notify").show();
      },
      success: function(data){
        $("#notify").hide();
        $("div.main_content").html(data);
      }
    });
    return false;
  });
});
