$(function() {
    $(".pagination a").live("click", function() {
        $.setFragment({ "page" : $.queryString(this.href).page })
        $(".pagination").html("<img src='/images/ajax-loader.gif' />");
        return false;
      });

    $.fragmentChange(true);
    $(document).bind("fragmentChange.page", function() {
        $.getScript($.queryString(document.location.href, 
                                  { "page" : $.fragment().page }));
      });

    if ($.fragment().page) {
      $(document).trigger("fragmentChange.page");
    }
  });