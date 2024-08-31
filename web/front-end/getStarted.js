

$(document).ready(function() {

    $('#scroll_button1').click(function() {
    
    $('html, body').animate({
    
    scrollTop: $('#about').offset().top
    
    }, 1000);
    
    });
    
    });




    $(document).ready(function() {

        $('#scroll_button2').click(function() {
        
        $('html, body').animate({
        
        scrollTop: $('#contacts').offset().top
        
        }, 1000);
        
        });
        
        });