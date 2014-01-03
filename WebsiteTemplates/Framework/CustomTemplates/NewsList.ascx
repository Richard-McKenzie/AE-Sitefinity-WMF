<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>

<telerik:RadListView ID="NewsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
	<LayoutTemplate>
		<sf:ContentBrowseAndEditToolbar ID="MainBrowseAndEditToolbar" runat="server" Mode="Add"></sf:ContentBrowseAndEditToolbar>
		<div class="mod news">
			<div class="mod-content">
				<ul class="mod-list">
					<asp:PlaceHolder ID="ItemsContainer" runat="server" />
				</ul>
			</div>
		</div>
	</LayoutTemplate>
	<ItemTemplate>
		<li class="item clearfix">
			<h2 class="title">
				<sf:DetailsViewHyperLink ID="DetailsViewHyperLink1" TextDataField="Title" ToolTipDataField="Description" runat="server" />
			</h2>
			<div class="meta">
				<div class="meta-item"><time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{PublicationDate.ToLocal():yyyy-MM-dd}'" />"><sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM dd, yyyy}" /></time></div>
				<sitefinity:FlatTaxonField CssClass="meta-item meta-tags" ID="FlatFieldControl" DisplayMode="Read" runat="server" WebServiceUrl="~/Sitefinity/Services/Taxonomies/FlatTaxon.svc" AllowMultipleSelection="true" TaxonomyId="CB0F3A19-A211-48a7-88EC-77495C0F5374" TaxonomyMetafieldName="Tags" Expanded="false" ExpandText="ClickToAddTags" BindOnServer="true" />
			</div>
			<sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="desc"  /> 
			<sf:DetailsViewHyperLink ID="FullStory" Text="<%$ Resources:NewsResources, FullStory %>" runat="server" CssClass="more" />
			<sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
		</li>
	</ItemTemplate>
</telerik:RadListView>
<sf:Pager id="pager" runat="server"></sf:Pager>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />