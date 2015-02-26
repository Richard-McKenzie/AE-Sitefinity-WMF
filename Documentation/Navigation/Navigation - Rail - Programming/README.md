#Template for a normal Rail Nav

To be able to copy this over, you need to copy all the files under:
\Custom\Navigation

Those are:
- RailNavigation.ascx
- RailNavigation.ascx.cs
- RailNavigation.ascx.designer.cs
- RecursiveNav.ascx
- RecursiveNav.ascx.cs
- RecursiveNav.ascx.designer.cs
- RecursiveULMenu.cs


Also for the widget to be visible on the edit mode, one entry needs to be added under:
Toolboxes\Toolboxes\PageControls\Sections\NavigationControlsSection\Tools

 - Control CLR Type or Virtual Path: `~/Custom/Navigation/RailNavigation.ascx`
 - Name: `RailNavigation`
 - Title: `Rail Navigation`
