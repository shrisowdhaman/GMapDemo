//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .
//= require lightbox/jquery.lightbox

<!-- used to fade out start-->
$(window).load(function() {
	fadeout('#error_explanation');
	fadeout('#alert');
        fadeout('#notice');
});

function fadeout(element)
{
	if($(element) != undefined)
	{
		$(element).delay(1500).fadeOut('slow');
	}
}
<!-- end -->
<!-- For Light box functonality Start-->

    $(function() {
        $('#gallery a').lightBox();
    });
  
  <!-- end -->