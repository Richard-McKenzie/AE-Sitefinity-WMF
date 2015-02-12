#Weather

Right now weather is in it's early stages.  We're currently using the this library to do the weather rendering: http://forecastfont.iconvau.lt/ .  Programming will to make the call to the weather service, store the weather icon and weather temp.  Then on page load, the weather module will grab the icon and temp from the database and display them (see example html).

##Currently supported weather feeds

These are feeds that we have done before and have the icon styling already done.

 - https://developer.forecast.io/ ( http://www.metlifestadium.com/ )

##Currently supported icons

The icons trigger a style class found on the _forecast.scss partial.  These can be tweaked and added to as needed.

 - clear-day
 - clear-night
 - cloudy
 - partly-cloudy-day
 - partly-cloudy-night
 - rain
 - snow
 - sleet
 - wind
 - fog

##Example HTML

```HTML
<a href="#Link-to-full-weather" title="Get latest weather" target="_blank" class="weather"> 
	<div class="weather-icon" data-weather="{{Weather.Icon}}">
		<span class="icon-layer-1"></span><span class="icon-layer-2"></span><span class="icon-layer-base"></span>
	</div> 
	<div class="weather-temp">{{Weather.Temp}}</div> 
</a>
```

##Example CSS
```SCSS
.weather {
	position: relative;
	top: 3px;
	display: inline-block;
	color: #cbd1d7;
	text-decoration: none;
	@include transition(all 0.2s ease-out);

	&:hover, &:focus {
		color: #fff;
		text-decoration: none;
	}
}

.weather-icon {
	display: inline-block;
	position: relative;
	top: 1px;
	width: 1em;
	height: 1em;
	line-height: 1em;
	text-align: left;
	vertical-align: top;
	@include x-rem(font-size, 36px);
}

.weather-temp {
	display: inline-block;
	vertical-align: top;
	@include x-rem(line-height, 38px);
	@include x-rem(font-size, 13px);

	// &:before {
	// 	content: '|';
	// 	display: inline-block;
	// 	padding: 0 0.5em 0 0.2em;
	// }

	&:after{
		content: '\b0';
	}
}
```