$(document).ready(function(){
    $(function() {
        setTimeout(function(){$( "#clouse-menu-button").show(0); }, 300);
        $( "#clouse-menu-button" ).click(function() {
            $( ".navigation-lang" ).hide( "slide", {}, 2000 );
            $( ".navigation" ).hide( "slide", {}, 2000 );
            $( ".navigation-head" ).hide( "slide", {}, 2000 );
            $(".ui-state-default").hide("slide", {}, 2000 );
            setTimeout(function(){ $(".ui-state-default-op").show(); }, 2000);
        });
        $( "#open-menu-button" ).click(function() {
            $( ".navigation-lang" ).show( "slide", {}, 2000 );
            $( ".navigation" ).show( "slide", {}, 2000 );
            $( ".navigation-head" ).show( "slide", {}, 2000 );
            $(".ui-state-default-op").hide();
            $(".ui-state-default").show("slide", {}, 2000 );
        });
    })
});