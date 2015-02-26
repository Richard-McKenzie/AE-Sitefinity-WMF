/* ==========================================================================
 * JQUERY FUNCTIONS
 * ----------------
 * Home of all of the jquery and javascript configurations and function calls
 * ========================================================================== */


//Owl Carousel Randomizer
function owlRandom(owlSelector){
  owlSelector.children().sort(function(){
      return Math.round(Math.random()) - 0.5;
  }).each(function(){
    $(this).appendTo(owlSelector);
  });
};


jQuery(function($) {

	/**
	* Tags
	*
	* Functions and calls related to tags and style helpers
	* Including:
	* - [data-tag] : Puts the tag inside of an attribute for easier styling
	*/

	// Style enhancement for tag listing.
	$('.sfTagsList span').each(function(i){
		$(this).attr('data-tag', $(this).text().replace(/\s+/g, ''));
	});


	/**
	* Pagination
	*
	* Extends the default pagination
	* Including:
	* - Next/Prev : Adds Next/Prev buttons
	* - Duplicate Pager : Adds support for a second pager so we can wrap the list in a pager
	*/

	// Adds in Pagination Previous / Next

	$('.sf_pagerNumeric').each(function(j){
		var pagerPrev = '', pagerNext = '';
		if($(this).find('.sf_PagerCurrent').prev('a').length > 0) {
			pagerPrev += '<a href="' + $(this).find('.sf_PagerCurrent').prev('a').attr('href') + '" class="prev" title="Previous" ></a>';
		}else{
			pagerPrev += '<span title="Previous" class="prev disabled"></span>';
		};
		if($(this).find('.sf_PagerCurrent').next('a').length > 0) {
			pagerNext += '<a href="' + $(this).find('.sf_PagerCurrent').next('a').attr('href') + '" class="next" title="Next" ></a>';
		}else{
			pagerNext += '<span title="Next" class="next disabled"></span>';
		};
		$(this).prepend(pagerPrev);
		$(this).append(pagerNext);
	});

	// Clone the pager and add it after the list
	// We should probably come up with a better solution for this. Wanted to avoid using 
	// a placeholder div because if the pager doesn't render the placeholder will still be there
	$('.pager').each(function(){
		var pager = $(this).clone().find('[id]').removeAttr('id');
		$(this).siblings('ol, ul').append(pager);
	});


	/**
	* Owl Carousel
	*
	* Support for the different slideshows/carousels that we have on the site.
	* Including:
	* - Main Slideshow
	* - Banner Rotate
	* - Image Gallery
	*/

	/* Main Slideshow 

	$(".slideshow").owlCarousel({
		autoPlay : 10000,
		stopOnHover : true,
		navigation:false,
		paginationSpeed : 1000,
		goToFirstSpeed : 2000,
		singleItem : true,
		autoHeight : true,
		// Navigation
		navigation : true,
		navigationText : ["Prev","Next"],
		rewindNav : true,
		scrollPerPage : false,
		transitionStyle:"fade"
	});*/


	/* Banner Rotate with random init 
	$(".banner-rotate").owlCarousel({
		autoPlay : 10000,
		stopOnHover : true,
		navigation:false,
		paginationSpeed : 1000,
		goToFirstSpeed : 2000,
		singleItem : true,
		autoHeight : true,
		// Navigation
		navigation : false,
		rewindNav : true,
		scrollPerPage : false,
		transitionStyle:"fade",
		beforeInit : function(elem){
			owlRandom(elem);
		}
	});*/


	/* Image Gallery
	 * - Double Owl Carousel with lazy load for Image Gallery - Gallery theme */

	// $('.gallery-slider-thumb .item').each(function(){
	// 	var ele = $(this).find('img.lazyOwl');
	// 	$(this).find('.gallery-slider-thumb-img').attr('data-src', ele.attr('data-src') );
	// 	ele.remove();
	// });
/*
	$('.gallery-slider').each(function(){

		var mySelf = $(this);

		var sync1 = $(this).find(".gallery-slider-large");
		var sync2 = $(this).find(".gallery-slider-thumb");

		sync1.owlCarousel({
			singleItem: true,
			slideSpeed: 1000,
			navigation: true,
			navigationText: ["",""],
			lazyLoad: true,
			lazyFollow: false,
			autoHeight: true,
			pagination: false,
			afterAction: syncPosition,
			responsiveRefreshRate: 200,
		});

		sync2.owlCarousel({
			items: 8,
			itemsDesktop      : [1199,8],
			itemsDesktopSmall : [979,7],
			itemsTablet       : [768,6],
			itemsMobile       : [479,4],
			pagination:false,
			lazyLoad: true,
			lazyFollow: false,
			navigation: true,
			navigationText: ["",""],
			responsiveRefreshRate : 100,
			responsiveBaseWidth: mySelf,
			afterInit : function(el){
				el.find(".owl-item").eq(0).addClass("synced");
			}
		});

		function syncPosition(el){
			var current = this.currentItem;
			sync2
			.find(".owl-item")
			.removeClass("synced")
			.eq(current)
			.addClass("synced")
			if(sync2.data("owlCarousel") !== undefined){
				center(current)
			}
		}

		sync2.on("click", ".owl-item", function(e){
			e.preventDefault();
			var number = $(this).data("owlItem");
			sync1.trigger("owl.goTo",number);
		});

		function center(number){
			var sync2visible = sync2.data("owlCarousel").owl.visibleItems;
			var num = number;
			var found = false;
			for(var i in sync2visible){
				if(num === sync2visible[i]){
					var found = true;
				}
			}

			if(found===false){
				if(num>sync2visible[sync2visible.length-1]){
					sync2.trigger("owl.goTo", num - sync2visible.length+2)
				}else{
					if(num - 1 === -1){
						num = 0;
					}
					sync2.trigger("owl.goTo", num);
				}
			} else if(num === sync2visible[sync2visible.length-1]){
				sync2.trigger("owl.goTo", sync2visible[1])
			} else if(num === sync2visible[0]){
				sync2.trigger("owl.goTo", num-1)
			}

		};
	}); 

    */

	/* Main Nav */

	//Menu Toggle, can go anywhere
	$('body').on('click', '.menu-toggle', function(e){
	  e.preventDefault();
	  $('.menu').toggleClass('active');
	  $(this).toggleClass('active')
	});

	$('.menu').on('click', '.has-sub', function(e){
	  e.preventDefault();
	  $(this).toggleClass('active');
	  $(this).siblings('ul').toggleClass('active');
	});



	//Adding menuSubExand for each item that has more than one level
	$('.menu').find('a').each(function(){
	  if ( $(this).siblings('ul').length > 0 ){
	    $(this).addClass('has-sub');
	  }
	});

    
    

	/* Tabs Nav */

	$('.tabs').each(function(i){
		var tab = $(this);
		tab.wrapInner('<div class="tab-panel">')
		tab.prepend('<div class="tab-nav clearfix" />');
		tab.find('.tab-section').each(function(j){
			$(this).attr('id', 'tabs' + i + j);	
			$(this).children('.tab-header').attr('href', '#tabs' + i + j);	
			tab.children('.tab-nav').append('<a href="#tabs' + i + j +'">' + $(this).children('.tab-header').html() + '</a>');
		});

		//Activates the first tab for desktop
		tab.find('.tab-section:first').addClass('active');
		tab.find('.tab-nav a:first').addClass('active');

		//Accordian
		tab.find('.tab-header').each(function(j){
			$(this).on('click', function(e){
				e.preventDefault();
				var index = $(this).parent().index();
				if(!$(this).hasClass('active')){
					tab.find('.tab-section > .active').removeClass('active');
					tab.find('.tab-section:eq(' + index + ')').children().toggleClass('active');
				}else{
					tab.find('.tab-section > .active').removeClass('active');
				};
			})
		});

		//Tab
		tab.find('.tab-nav a').each(function(j){
			$(this).on('click', function(e){
				e.preventDefault();
				var index = $(this).index();
				tab.find('.tab-section, .tab-nav a').removeClass('active');
				tab.find('.tab-section:eq(' + index + '), .tab-nav a:eq(' + index + ')').toggleClass('active');
			})
		});
	});


	/* Photo Galleries */

	$('[data-popup="true"]').each(function(){
		$(this).magnificPopup({ 
			type: 'image'
		});		
	});

	/* Add transparent to all iframes */

	$('iframe').each(function(){
		var url = $(this).attr("src");
        
        if(url){
		  $(this).attr("src",url+"?wmode=transparent");
        }
	});

	/* Form functions */

	// form-label-hide

	var formsUsePlaceholder = true;

	if(formsUsePlaceholder){
		// Sets placeholders on text fields
		$('.sfFormBox').each(function(e){
			var label = $(this).find('.sfTxtLbl').text();
			// $(this).find('.sfTxtLbl').addClass('visuallyhidden');
			$(this).find('input').attr('placeholder', label);
		});

		// Sets placeholders on textarea
		$('.sfFormBlock').each(function(e){
			var label = $(this).find('.sfTxtLbl').text();
			// $(this).find('.sfTxtLbl').addClass('visuallyhidden');
			$(this).find('textarea').attr('placeholder', label);
		});
	};

	// Changes input type for html5 inputs
	// Might need to rework this in the future.

	$('[class*="form-type-"]').each(function(e){
		var inputType = $(this).attr('class').match('form-type-([a-zA-Z]+)')[1];
		$(this).find('input[type="text"]').get(0).type=inputType;
	});
});