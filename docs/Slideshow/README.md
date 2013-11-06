#Template for Slideshow
Slideshow uses a module builder template. The following is the list template for the following data fields:
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