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

##Microformats
We're working on providing built in support for different microformats. Currently supported are:

- News - schema
- Events - 