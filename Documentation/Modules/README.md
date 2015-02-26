#Modules

Modules are at the core of the system. In order to make the modules as flexible as while providing a consistent look and feel, they will share the same structure. If you want to do module specific styles, you will need to target them based on their identifying class (e.g. The News detail will have class `news`).

##Naming Convention
Our modules will share a basic, simple naming convention.
- **Core Module** (aka details view) is our base module and won't have any suffix attached to it. Class name will be name of the module + "module" (e.g. `news module`).
- **Listing Module** is a grouping of multiple core modules in a list. This is normally seen on like a News or Events Listing page and it's not too uncommon to have pagination or filters tied to it. A listing page have the name of the module + module-listing (e.g. `news module-listing`).
- **Rail Module** is similar to the listing module, but on a smaller scale. The Rail module will primarily be found in a smaller aside container and will likely be limited to show just a few items. The Rail module will have the name of the module + module-rail (e.g. `news module-rail`).

##Modules at the Core
At it's core, a module will most likely have the following: 

- **Title** 
- **Meta** - Extra information to describe the module (Dates, Tags, Author)
- **Summary** - Short excerpt for the content
- **Content**

Basic styling for each of these items is provided in the modules partial.  If you need to style one module separately from the other modules, either override it with that module's class, or use a different naming convention.

##Item Lists and Module Lists
Our Item List styles are used as a base for all lists.  By themselves, all that `.item-list` is composed of is a simple ul li block list. However, we use this as a building block for our `.module-list` styles.  

The `.item-list` class controls the layout, while the `.module-list` class controls the shared styles between different module lists.

##Module Templates
These are the built in Sitefinity templates for the news and our designation for them. Feel free to create more or remove them as needed on a per site basis.

###News
- Titles and Dates - Rail Module
- Titles Only - Rail Module
- Titles, dates and summaries - Listing Module
- Titles, dates and full content - Listing Module

##Custom Fields

###News
- Featured Image - This will show up by default on the Listing Modules for Titles, dates and summaries. Can be used on other modules as needed. TODO: We should see if we can encase this in a Conditional If statement (might need to post on the forums/G+/ask Telerik).

##Pagination
Sitefinity only allows one pager for lists. If we want a top and bottom one we either need to involve programming or fix this with jQuery. I've gone ahead and applied a fix in jquery-functions that adds the pagination to the top of the list. 

##Multiple Modules Per Page
Because of the way that Sitefinity does widget detail and widget listings, you might need to change the `ContentViewDisplayMode` to `master` in the advanced settings of that module. To understand this, lets imagine a site that has a news rail widget in the footer.  To keep it from going to the detailed view when you are on the news detail page, you need to change the ContentViewDisplayMode.

You can also support multiple lists with their own pagination by changing the `UrlKeyPrefix` field. You can find a blog article about it here: http://www.sitefinity.com/blogs/slavo-ingilizovs-blog/2011/12/15/url_filtering_with_multiple_content_widgets_per_page

##Microformats
We're working on providing built in support for different microformats. http://www.google.com/webmasters/tools/richsnippets


Currently supported are:

- News - schema
- Events - 