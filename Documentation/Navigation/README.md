#Navigation
Navigation module for Sitefinity is used to create the Main Nav, Rail Nav, Site Map, or any navigation list that the client would want.

##Main Nav
Use the navigation widget, select Horizontal Nav with dropdowns, and then make sure the standard template is included in the Widget Template.  If you want to have multiple horizontal navs on the same page you can add a nav specific class through the widget designer "CSS class" so you can keep the same widget template.

##Rail Nav
The rail navigation is essentially same ul li output as the main nav. In order to make this look like the rail nav we have to hide all of the li's that don't have the `on` class tied to them.  It would be nice if we could have an `active` class to highlight the current page so we could style it differently than the `on` but we'll have to live with that.

One special thing about the nav-rail.scss partial is it includes a `.nav-rail-heading` that is extended to help clarify where the nav heading is styled at. If we pursue the Navigation Rail programming piece we could potentially support both widgets with the same partial without having to change anything but this class (we would also have to create a `.nav-rail-item` as well).

TODO: See if we want to add the programming rail to this and document how it's different.

##Site Map
The Site Map was built to be almost a plug'n'play solution for a sitemap. The only styling that should be needed for this is configuring the sass variables or fixing some style conflicts.