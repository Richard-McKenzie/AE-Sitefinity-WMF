#Boilerplate Documentation

##Prepros Config
 - Options
   - More -> Filter Patterns - Add `.js` 

##Sass Structure
 - http://thesassway.com/beginner/how-to-structure-a-sass-project

##SF Info
 - Folder Structure
   - http://www.sitefinity.com/documentation/documentationarticles/designer-s-guide/website-templates-file-structure
 - http://www.sitefinity.com/documentation/documentationarticles/designer-s-guide




Apply Theme Globally
 - Administration -> Settings -> Advanced -> Appearance -> `DefaultFrontEndTheme` change the name.



 Add this to web.config inside one of the <system.webServer> (should be already added)

```
<httpProtocol>
  <customHeaders>
    <add name="X-UA-Compatible" value="IE=edge" />
  </customHeaders>
</httpProtocol>
```
