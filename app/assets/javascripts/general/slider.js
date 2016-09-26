var ready;
ready = function() {

 $(".owl-carousel").owlCarousel({

     navigation : false, // Show next and prev buttons
     slideSpeed : 300,
     paginationSpeed : 400,
     singleItem :true,
     autoPlay : 5000,

     // "singleItem:true" is a shortcut for:
     // items : 1,
     // itemsDesktop : false,
     // itemsDesktopSmall : false,
     // itemsTablet: false,
     // itemsMobile : false

 });

};

$(document).ready(ready);
$(document).on('page:load', ready);
