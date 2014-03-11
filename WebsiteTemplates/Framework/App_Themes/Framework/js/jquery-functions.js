
jQuery(function($) {

	$('.search-toggle').on('click',function(e){
		e.preventDefault();
		$('.sfsearchBox').toggleClass('active');
		$(this).toggleClass('active');
	})

	/* Owl Carousel */

	// $(".slideshow").owlCarousel({
	// 	autoPlay : 10000,
	// 	stopOnHover : true,
	// 	navigation:false,
	// 	paginationSpeed : 1000,
	// 	goToFirstSpeed : 2000,
	// 	singleItem : true,
	// 	autoHeight : true,
	// 	// Navigation
	// 	navigation : true,
	// 	navigationText : ["Prev","Next"],
	// 	rewindNav : true,
	// 	scrollPerPage : false,
	// 	transitionStyle:"fade"
	// });


	//Resizes videos to fit containers
	$(".container").fitVids();

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

	//Wrapping each first level nav in a div to fix a FF bug related to table-cell not using position
	$('.menu > li').each(function() {
		$(this).wrapInner('<div class="menu-item-wrap" />');
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

	/* Pagination Previous / Next */

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
	/* Photo Galleries */

	$('.popup').each(function(){
		$(this).magnificPopup({ 
			type: 'image'
		});		
	});

	$('.popupimage').each(function(){
		if (/(jpg|gif|png|JPG|GIF|PNG|JPEG|jpeg)$/.test($(this).attr('href'))){
			$(this).magnificPopup({ 
				type: 'image'
			});
		};
	});

	$('.gallery').each(function() { // the containers for all your galleries
		$(this).magnificPopup({
			delegate: '[data-popup=true]', // the selector for gallery item
			type: 'image',
			gallery: {
				enabled:true
			}
		});
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