Sitefinity
==========

Repository of various Sitefinity tools and modules

Sandbox: http://sitefinity7-demo.idevdesign.net/

##Setup
1. Download the repository and place it in the web folder of the design site or a local folder that you will sync to the design site.
2. Add the template files to Prepros
3. Add your theme to Sitefinity
4. Convert your HTML Template to a Sitefinity Template

##Prepros
- Install Prepros
- Add the theme folder `App_Data\Sitefinity\WebsiteTemplates\Framework\App_Themes\Framework` into Prepros. You can do this by drag and dropping the Framework theme folder into Prepross. 
- By default Prepros will attempt to minify JS files. Might not be a bad idea to look at down the road, but for now you can disable that by going to the Project Options (hit the gear icon) -> Project Filters and add `.js` to this to filter out js files. 
- Once that is done refresh your project

##Sitefinity
The first thing to know about adding your theme/template to Sitefinity is understanding the folder structure.

###Articles on Sitefinity Folder Structure
- http://www.sitefinity.com/documentation/documentationarticles/designer-s-guide/website-templates-file-structure
- http://www.sitefinity.com/documentation/documentationarticles/designer-s-guide

##Adding Your Theme to Sitefinity
Go to:
- Administration -> Settings -> Advanced -> Appearance -> Frontend Themes
- "Create New"
	- Name : `Site Name`
	- Path : `~/App_Data/Sitefinity/WebsiteTemplates/Framework/App_Themes/Framework`

##Making a Sitefinity Template
Your masterpage `~/App_Data/Sitefinity/WebsiteTemplates/Framework/App_Master/Framework.master` will hold the core structure of your site.

*TODO: Add some tips to converting html template to masterpage*

Once you have your masterpage file created, it's time to create a page template from this.
- Design -> Page Templates
- Click on "Create a template"
	- Name : `Base Template`
	- Template. Select "Use Template" and then "Select another Template"
		- "Use your own .master file"
		- "Browse other folders" and then navigate to where your master page is at (should be App_Data/Sitefinity/WebsiteTemplates/Framework/App_Master/)
		- Select your template and click "Use Selected"
	- Create and go to add content
- Once on the Template editor we need to modify the Theme
	- Theme
		- Select the theme that you created in Step 1.

##Step 3: Custom Layout Widgets
Sometimes you need to create custom layout controls instead of using the prebuilt ones. *TODO: Add instructions for custom layouts here*

##IE Edge
Set this to remove the option for IE to use compatibility mode. Put this in web.config before `</system.webServer>`

```
<httpProtocol>
  <customHeaders>
    <add name="X-UA-Compatible" value="IE=edge" />
  </customHeaders>
</httpProtocol>
```

##Next Steps
*TODO Remove this next text* While we are working on documentation, we're going to go through all of the folders and make sure each folder is up to date with the current release. Use this list below for a 

- [SASS](./SASS.md)
- [Modules](./Modules/README.md)
- [Site Map](./Navigation/Sitemap/README.md)
