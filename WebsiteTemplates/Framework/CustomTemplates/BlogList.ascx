<%@ Control Language="C#" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.Comments" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Import Namespace="Telerik.Sitefinity" %>	

<telerik:RadListView ID="Repeater" ItemPlaceholderID="ItemsContainer" runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
<LayoutTemplate>
	<sf:ContentBrowseAndEditToolbar ID="MainBrowseAndEditToolbar" runat="server" Mode="Add"></sf:ContentBrowseAndEditToolbar>
	<div class="blog-list module">
		<ul class="module-list">
			<asp:PlaceHolder ID="ItemsContainer" runat="server" />
		</ul>
	</div>
</LayoutTemplate>
<ItemTemplate>
	<li class="item">

		<h2 class="title">
			<sf:DetailsViewHyperLink TextDataField="Title" ToolTipDataField="Description" runat="server" />
		</h2>

		<div class="meta">
			<div class="meta-item author">
				<asp:Literal ID="Literal2" Text="<%$ Resources:Labels, By %>" runat="server" /> 
				<sf:PersonProfileView runat="server" />
			</div>
			<div class="meta-item date">
				<time datetime='<sf:FieldListView ID="PublicationTime" runat="server" Format="{PublicationDate.ToLocal():yyyy-MM-dd}'" />"><sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMM dd, yyyy}" /></time>
			</div>
		</div>   

		<sf:FieldListView ID="PostContent" runat="server" Text="{0}" Properties="Summary" WrapperTagName="div" WrapperTagCssClass="summary" />

		<sf:DetailsViewHyperLink ID="FullStory" Text="<%$ Resources:BlogResources, FullStory %>" runat="server" CssClass="more" />

		<sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>
	</li>
</ItemTemplate>
</telerik:RadListView>
<sf:Pager id="pager" runat="server"></sf:Pager>
<asp:PlaceHolder ID="socialOptionsContainer" runat="server" />