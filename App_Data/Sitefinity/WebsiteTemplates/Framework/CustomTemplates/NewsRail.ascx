<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>

<div class="module news-rail">
	<telerik:RadListView ID="NewsList" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
	<LayoutTemplate>
		<sf:ContentBrowseAndEditToolbar ID="MainBrowseAndEditToolbar" runat="server" Mode="Add"></sf:ContentBrowseAndEditToolbar>

			<div class="module-head">
				<h2 class="title">Latest News</h2><a href="/about/news/" class="more">View all</a>
			</div>
			<div class="module-content">
				<ul class="module-list">
					<asp:PlaceHolder ID="ItemsContainer" runat="server" />
				</ul>
			</div>
	</LayoutTemplate>
	<ItemTemplate>
		<li class="item">
			<h3 class="title">
				<sf:DetailsViewHyperLink ID="DetailsViewHyperLink1" TextDataField="Title" ToolTipDataField="Description" runat="server" />
			</h3>
			<div class="meta">
				<div class="meta-item">
					<time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{PublicationDate.ToLocal():yyyy-MM-dd}'" />"><sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM dd, yyyy}" /></time>
				</div>
			</div>
			<sf:FieldListView ID="summary" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="content"  /> 
			<sf:DetailsViewHyperLink ID="FullStory" Text="<%$ Resources:NewsResources, FullStory %>" runat="server" CssClass="more-alt" />
			<sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
		</li>
	</ItemTemplate>
	</telerik:RadListView>
	<sf:Pager id="pager" runat="server"></sf:Pager>
	<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />
</div>