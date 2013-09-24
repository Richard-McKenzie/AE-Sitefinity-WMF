// Avoid `console` errors in browsers that lack a console.
if (!(window.console && console.log)) {
    (function() {
        var noop = function() {};
        var methods = ['assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error', 'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log', 'markTimeline', 'profile', 'profileEnd', 'markTimeline', 'table', 'time', 'timeEnd', 'timeStamp', 'trace', 'warn'];
        var length = methods.length;
        var console = window.console = {};
        while (length--) {
            console[methods[length]] = noop;
        }
    }());
}

/*
 * Match Heights jQuery Plugin
 * 
 * Version 1.7alpha (Updated 5/30/2012)
 * Copyright (c) 2010-2012 Mike Avello
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */
(function($) {
	$.fn.matchHeights = function(settings) {
		settings = jQuery.extend(this,{
			minHeight: null,	// optional minimum height setting
			maxHeight: null,	// optional maximum height setting, forced height instead of min-height
			extension: 0,		// optional amount to add to calculated height
			overflow: false		// optional setting for overflow. Default is false; overflow attribute not set
		}, settings);
		
		var extension = settings.extension;
		var tallest = (settings.minHeight) ? settings.minHeight : 0;
		
		this.each(function() {			
			tallest = Math.max(tallest, $(this).outerHeight()  );
		});
		
		if ( settings.maxHeight && (tallest > settings.maxHeight) ) {
			tallest = settings.maxHeight;
		};
		
		return this.each(function() {
			var element = $(this);
			var padding = element.innerHeight() - element.height();
			var extra = padding + ( element.outerHeight() - element.innerHeight() );
			element.css({'min-height': tallest - extra + extension}); 
		});
	}
})(jQuery);