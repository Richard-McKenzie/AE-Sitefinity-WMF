
jQuery(function($) {

	//Resizes videos to fit containers
	$(".container").fitVids();

	/* Main Nav */

	//Menu Toggle, can go anywhere
	$('body').on('click', '.menu-toggle', function(e){
	  e.preventDefault();
	  $('.menu').toggleClass('active');
	});

	$('body').on('click', '.menu-sub-expand', function(e){
	  e.preventDefault();
	  $(this).toggleClass('active');
	  $(this).siblings('ul').toggleClass('active');
	});

	//Wrapping each first level nav in a div to fix a FF bug related to table-cell not using position
	$('.menu > li').each(function() {
		$(this).wrapInner('<div class="menu-item-wrap" />');
	});

	//Adding menuSubExand for each item that has more than one level
	$('.menu').find('a').each(function(){
	  if ( $(this).siblings('ul').length > 0 ){
	    $(this).addClass('has-sub');
	    $(this).after('<a class="menu-sub-expand"/>');
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

});