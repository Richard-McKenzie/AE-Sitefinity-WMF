#Search

##Styling the Search Form	

###HTML
In Sitefinity the search form template isn't accessible. However, we can get around this and provide our own file for use. We need to use the ViewMap functionality to map the front end view to a custom file.

1. Go to Administration -> Settings -> Advanced -> Controls -> View Map
2. Create a new item here with the following data:
  - HostType: `Telerik.Sitefinity.Services.Search.Web.UI.Public.SearchBox, Telerik.Sitefinity.Search.Impl`
  - LayoutTemplatePath: `~/Custom/Widgets/Search/SearchBox.ascx`
3. Recompile the site.
4. This will override the built in form style. So just drag and drop the normal widget onto the page and it will pull it's design template from this file.

###CSS
All styling for the search will be located inside of the partial `_search.scss`. If you use a search box in the header it's important to use css [SpeciFISHity](http://www.standardista.com/css3/css-specificity/) to only style the header.

##Setting up the search index
Search indexes are created under Administration -> Search Indexes. You can select what modules and widgets are included in this search index (you should almost ALWAYS exclude "Static HTML in pages").  Once created you tie each search form to a specific search index.  This index will normally take a day or 2 to create.

##Excluding items from the index
In order to exclude items from search index there are a few ways to do it:

- Go to the Search Indexes in the Administration and uncheck different modules
- For Content Blocks you there is a setting under advanced options to "ExcludeFromSearchIndex" 
- Get programming to make a non-searchable layout (good last resort but takes more time and makes the layouts more cluttered)