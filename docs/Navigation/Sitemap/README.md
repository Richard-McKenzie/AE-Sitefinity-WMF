#Sitemap
Sitefinity's sitemap tool is pretty limited in responsive sites as well as sites with many levels deep. Our custom one works to provide a solution that will fill a variety of sites as well as making it easy to extend.

##CSS
Include the `_sitemap.scss` partial into your main.scss. Everything should pull the styles automatically. If you need to change anything, first look at the variables at the top. Override these in main.scss for any style changes. If you need to change the layout outside of changing these variables, go ahead and change the partial.

##HTML
Sitemap.ascx contains the Design Template for the Sitefinity widget. Simply put a Navigation widget on the page and override the sitemap design template with this code.