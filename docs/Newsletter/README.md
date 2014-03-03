#Newsletter

##Styling the Newsletter Signup Form

###HTML
In Sitefinity (6.3) the Newsletter Signup form template isn't accessible. However, we can get around this and provide our own file for use.

1. Grab the custom SearchBox.ascx file and place it `~\Custom\Widgets\CustomNewsLetterSignup.ascx`
2. Go to Administration -> Settings -> Advanced -> Controls -> View Map
3. Create a new item here with the following data:
  - HostType: `Telerik.Sitefinity.Modules.Newsletters.Web.UI.Public.SubscribeForm, Telerik.Sitefinity`
  - LayoutTemplatePath: `~/Custom/Search/SearchBox.ascx`
4. This will override the built in Newsletter Signup form style. So just drag and drop the normal widget onto the page and it will pull it's design template from this file.

###CSS
Currently we don't have a base layout for the Newsletter Signup Form. For now just place your own custom layout inside of `_newsletter.scss`.