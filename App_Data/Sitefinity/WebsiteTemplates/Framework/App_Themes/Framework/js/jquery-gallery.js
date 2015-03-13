/* ==========================================================================
 * JQUERY Specific to Gallery (transfer over to jquery functions if you are going to use them)
 * ========================================================================== */

jQuery(function($) {
// Single Slider
	$('.slider').slick({
		  infinite: true,
		  dots: true,
	});

// Slider with Thumbnails Horizontal
	 $('.gallery-for').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  asNavFor: '.gallery-nav',
	  arrows:false,
	});
	$('.gallery-nav').slick({
	  slidesToShow: 6,
	  slidesToScroll: 1,
	  asNavFor: '.gallery-for',
	  lazyLoad: 'ondemand',
	  centerMode: true,
	  focusOnSelect: true,
	  responsive: [
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 5,
	         centerPadding: '0',
	         
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 3,
	        centerPadding: '0',
	      }
	    }
	  ]
	});

// Slider with Vertical Thumbnails
	 $('.vert-for').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  asNavFor: '.vert-nav',
	  arrows:false,
	});
	$('.vert-nav').slick({
	  slidesToShow: 6,
	  slidesToScroll: 1,
	  asNavFor: '.vert-for',
	  lazyLoad: 'ondemand',
	  centerMode: true,
	  focusOnSelect: true,
	  responsive: [
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 5,
	         centerPadding: '0',
	         
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 3,
	        centerPadding: '0',
	      }
	    }
	    // You can unslick at a given breakpoint now by adding:
	    // settings: "unslick"
	    // instead of a settings object
	  ]
	});
});