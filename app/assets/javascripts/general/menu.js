
$(document).on('ready page:load', function()
{
    $(".burger").click(function()
    {
        $(".ulmenu").toggleClass("activemenu");
    });
});

$(window).resize(function(){
    $(".ulmenu").removeClass("activemenu");
});
