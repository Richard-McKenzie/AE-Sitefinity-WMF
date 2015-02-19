#Framework Documentation

##Prepros Config
- Options
- More -> Filter Patterns - Add `.js` 
- Refresh project
- SCSS file -> Enable `full compass support` and `Use config.rb`
- On older sites, if you get an svg error, on your main.scss file replace the experiemental-support-for-svg line with `
$svg-gradient-shim-threshold: 0.1;`

##Sass Structure
- http://thesassway.com/beginner/how-to-structure-a-sass-project

##SF Info
- Folder Structure
	- http://www.sitefinity.com/documentation/documentationarticles/designer-s-guide/website-templates-file-structure
	- http://www.sitefinity.com/documentation/documentationarticles/designer-s-guide



##Step 1: Add your Theme
Go to:
- Administration -> Settings -> Advanced -> Appearance -> Frontend Themes
- "Create New"
	- Name : `Site Name`
	- Path : `~/App_Data/Sitefinity/WebsiteTemplates/Framework/App_Themes/Framework`

##Step 2: Create Template
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
Sometimes you need to create custom layout controls instead of using the prebuilt ones.

Test

 Add this to web.config inside one of the <system.webServer> (should be already added)


##Step 4: Adding Content
- Images 
	- Whenever you need to use images on your templates, always add them through the admin. Create an image library called "Layout" and upload all layout related images to that.

```
<httpProtocol>
  <customHeaders>
    <add name="X-UA-Compatible" value="IE=edge" />
  </customHeaders>
</httpProtocol>
```
