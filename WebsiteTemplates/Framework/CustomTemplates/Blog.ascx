<%@ Control Language="C#" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.ContentUI" Assembly="Telerik.Sitefinity" %>
<%@ Register TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI.PublicControls.BrowseAndEdit"
Assembly="Telerik.Sitefinity" %>
<%@ Import Namespace="Telerik.Sitefinity" %>
<telerik:RadListView ID="SingleItemContainer" ItemPlaceholderID="ItemContainer" AllowPaging="False"
runat="server" EnableEmbeddedSkins="false" EnableEmbeddedBaseStylesheet="false">
<layouttemplate>	
	<article class="article news module" itemscope="" itemtype="http://schema.org/Blog">
		<asp:PlaceHolder ID="ItemContainer" runat="server" />
	</article>
</layouttemplate>
<itemtemplate>	
	<h1 class="title" itemprop="name"><%# Eval("Title") %></h1>
	<div class="meta">
		<div class="meta-item date" itemprop="dateCreated">
			<%-- TODO: Make this datetimestamp --%>
			<sf:FieldListView ID="PublicationDate" runat="server" Format="{PublicationDate.ToLocal():MMMM dd, yyyy}" />
		</div>
		<div class="meta-item author" itemprop="author">
			<asp:Literal Text="<%$ Resources:Labels, By %>" runat="server" /> 
			<sf:PersonProfileView runat="server" />
		</div>
	</div>

	<sf:ContentBrowseAndEditToolbar ID="BrowseAndEditToolbar" runat="server" Mode="Edit,Delete,Unpublish"></sf:ContentBrowseAndEditToolbar>

	<div class="content" itemprop="text">
		<%# Eval("Content") %>
	</div>

	<sf:MasterViewHyperLink class="back" Text="<%$ Resources:NewsResources, AllNews %>" runat="server" />

	<asp:PlaceHolder ID="socialOptionsContainer" runat="server"></asp:PlaceHolder>
	<sf:ContentView id="commentsListView" ControlDefinitionName="BlogsCommentsFrontend" DetailViewName="CommentsMasterView" ContentViewDisplayMode="Master" runat="server" />
	<sf:ContentView id="commentsDetailsView" ControlDefinitionName="BlogsCommentsFrontend" DetailViewName="CommentsDetailsView" ContentViewDisplayMode="Detail" runat="server" />
</itemtemplate>
</telerik:RadListView>