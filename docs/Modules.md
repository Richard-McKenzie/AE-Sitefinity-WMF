#Modules

Modules are at the core of the system. In order to make the modules as flexible as while providing a consistent look and feel, they will share the same structure. If you want to do module specific styles, you will need to target them based on their identifying class (e.g. The News detail will have class `news`).

##Naming Convention
Our modules will share a basic, simple naming convention.
- **Core Module** (aka details view) is our base module and won't have any suffix attached to it (e.g. `news`).
- **Listing Module** is a grouping of multiple core modules in a list. This is normally seen on like a News or Events Listing page and it's not too uncommon to have pagination or filters tied to it. A listing page will be suffixed with **-listing** (e.g. `news-listing`).
- **Rail Module** is similar to the listing module, but on a smaller scale. The Rail module will primarily be found in a smaller aside container and will likely be limited to show just a few items. The Rail module will be suffixed with **-rail** (e.g. `news-rail`).

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
- Featured Image - This will show up by default on the Listing Modules. Can be used on other modules as needed.


##Microformats
We're working on providing built in support for different microformats. Currently supported are:

- News - schema
- Events - 