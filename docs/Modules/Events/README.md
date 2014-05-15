#Events Documentation


##Bug Fixes
 - 'Upcoming and current events' doesn't display correctly.
   - Fix: 
		1. Set to display 'All Upcomming, Current, and Past Events'
		2. Go to Advanced -> ControlDefinition -> Views -> EventsFrontendList.  Change the 'FilterExpression' value to reflect the following: `Visible = true AND Status = Live AND (EventStart >= DateTime.UtcNow OR EventEnd >= DateTime.UtcNow)`
	- Source http://www.telerik.com/support/pits.aspx#/public/sitefinity/14188