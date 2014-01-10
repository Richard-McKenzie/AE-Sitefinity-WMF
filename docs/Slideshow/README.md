#Slideshow
Slideshow uses a module builder template. We use [Owl Carousel](http://owlgraphic.com/owlcarousel/) to power it. All of the files should already be in the project.

##Javascript
Make sure the owl.couresel.min.js file is added to your Framework.master page 
```html 
<script src="/Sitefinity/WebsiteTemplates/Framework/App_Themes/Framework/js/vendor/owl.carousel.min.js"></script>
```

Next, make sure and take a look at the [configuration options](http://owlgraphic.com/owlcarousel/#customizing) in jquery-functions.js and configure these as needed:
```js
/* Owl Carousel */
$(".slideshow").owlCarousel({
	autoPlay : 10000,
	stopOnHover : true,
	navigation:false,
	paginationSpeed : 1000,
	goToFirstSpeed : 2000,
	singleItem : true,
	autoHeight : true,
	// Navigation
	navigation : true,
	navigationText : ["Prev","Next"],
	rewindNav : true,
	scrollPerPage : false,
	transitionStyle:"fade"
});
```

##SASS
The styling is managed through 2 sass files which should already be included in the framework.  The first is the required file `@import "vendor/owlcarousel";` which should go in with your other third party styles and left alone.  The second one is `@import "partials/owltheme";` which will go in with your site specific files and is the one that you use to customize the slideshow.


##Widget Template
The following is the list template for the following data fields. Feel free to change these as needed as these are just used as the example.

- Title : Short Text
- Description : Long Text
- Image : Media

```ascx
<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Fields" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<telerik:RadListView ID="dynamicContentListView" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
<LayoutTemplate>
	<div class="slideshow owl-carousel">
		<asp:PlaceHolder ID="ItemsContainer" runat="server" />
	</div>
</LayoutTemplate>
<ItemTemplate>
	<div class="slideshow-item">
		<div class="slideshow-media">
			<sf:ImageAssetsField runat="server" DataFieldName="Image" IsThumbnail="False" />
		</div>
		<div class="slideshow-content">
			<h2 class="title">
				<sf:DetailsViewHyperLink ID="DetailsViewHyperLink" TextDataField="Title" runat="server" />
			</h2>
			<div class="desc">
				<%# Eval("Description")%>
			</div>
		</div>
	</div>
</ItemTemplate>
</telerik:RadListView>
<sf:Pager id="pager" runat="server"></sf:Pager>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server"></asp:PlaceHolder>
```
