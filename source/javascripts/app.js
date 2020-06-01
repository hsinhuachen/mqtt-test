//= require ./vendors/jquery.js
//= require ./vendors/bootstrap.bundle.min.js
//= require ./vendors/jquery.easing.js
//= require ./vendors/imagesloaded.pkgd.min.js
//= require ./vendors/lc_switch.min.js
//= require ./vendors/slick.min.js

$(document).ready(function() {
	var app = {
		detectIE: function() {
			var ua = window.navigator.userAgent;
			var msie = ua.indexOf("MSIE ");
			if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
				$('body').addClass('is-IE');
			}
			return false;
		},
		navMenu: function(){
			
		},
		svgimg: function(){
			$('img.svgimg').each(function(){
		        var $img = $(this);
		        var imgID = $img.attr('id');
		        var imgClass = $img.attr('class');
		        var imgURL = $img.attr('src');
		    
		        jQuery.get(imgURL, function(data) {
		            // Get the SVG tag, ignore the rest
		            var $svg = jQuery(data).find('svg');
		    
		            // Add replaced image's ID to the new SVG
		            if(typeof imgID !== 'undefined') {
		                $svg = $svg.attr('id', imgID);
		            }
		            // Add replaced image's classes to the new SVG
		            if(typeof imgClass !== 'undefined') {
		                $svg = $svg.attr('class', imgClass+' replaced-svg');
		            }
		    
		            // Remove any invalid XML tags as per http://validator.w3.org
		            $svg = $svg.removeAttr('xmlns:a');
		            
		            // Check if the viewport is set, else we gonna set it if we can.
		            if(!$svg.attr('viewBox') && $svg.attr('height') && $svg.attr('width')) {
		                $svg.attr('viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width'))
		            }
		    
		            // Replace image with new SVG
		            $img.replaceWith($svg);
		    
		        }, 'xml');
		    });	
		},
		init: function() {
			this.detectIE();
			this.navMenu();
			this.svgimg();
			
			$("#gotop").on('click', function(event) {
				event.preventDefault();
				
				$("body,html").animate({
		          scrollTop: 0,
		        }, 1200, 'easeOutCubic');
			});

			// $('.cycle').carousel({
			// 	interval: 5000
			// });
		}
	} // end app
	app.init();
});
