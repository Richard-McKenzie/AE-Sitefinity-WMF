#Search

##Styling the Search Form	

###HTML
In Sitefinity (6.3) the search form template isn't accessible. However, we can get around this and provide our own file for use.

1. Grab the custom SearchBox.ascx file and place it `~\Custom\Search\SearchBox.ascx`
2. Go to Administration -> Settings -> Advanced -> Controls -> View Map
3. Create a new item here with the following data:
  - HostType: `Telerik.Sitefinity.Services.Search.Web.UI.Public.SearchBox, Telerik.Sitefinity.Search.Impl`
  - LayoutTemplatePath: `~/Custom/Search/SearchBox.ascx`
4. This will override the built in form style. So just drag and drop the normal widget onto the page and it will pull it's design template from this file.

###CSS
Currently we don't have a base layout for the search. For now just place your own custom layout for the search form inside of `_search.scss`.

##Styling the Search Results

Included in the search sass partial `_search.scss` you will find a basic search results page. This can be left as is or customized in order to fit your site's need.

##Setting up the search index

Search indexes are created under Administration -> Search Indexes. You can select what modules and widgets are included in this search index.  Once created you tie each search form to a specific search index.

##Excluding items from the index

Excluding items for the index that aren't found in scope at this point is a huge pain.  The only way this can be done is to declare it in html layouts that the inserted layout should be excluded from search.  This will require us to plan ahead of time and figure out which regions should be excluded.

These layouts are created just like the custom layouts. The only difference when you add them to toolbox.config or through the admin, the type needs to be `SitefinityWebApp.Custom.Layout.NonSearchableLayout, SitefinityWebApp`

```xml
<add enabled="True" type="SitefinityWebApp.Custom.Layout.NonSearchableLayout, SitefinityWebApp" title="Search Exclude" description="Search Exclude" layoutTemplate="~/App_Data/Sitefinity/WebsiteTemplates/Framework/CustomLayouts/Search-Exclude.ascx" visibilityMode="None" name="Search-Exclude" />```